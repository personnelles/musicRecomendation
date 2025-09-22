import sqlalchemy as sql
import pandas as pd
from collections import defaultdict
from surprise import Reader, Dataset
from surprise import SVD

engine = sql.create_engine('mysql+pymysql://root:root@localhost:3306/music_recommendation?charset=utf8mb4')

with engine.connect() as conn:
    sql_stat = ('select au.id id, au.username username,ic.song_id,iss.list_lable from auth_user au join '
                'users_usercollectionsong on au.id = ic.user_id join index_song iss on iss.song_id=ic.song_id;')
    df = pd.read_sql_query(sql_stat, conn)
df['genres'] = df['list_lable'].str.strip().str.split()
df['genres'] = df['genres'].apply(lambda x: sorted(x))
df.drop(['list_lable'], axis=1, inplace=True)
data = defaultdict(dict)
for idx, row in df.iterrows():
    mx = data[row['id']]
    mx[row['song_id']] = row['genres']

records = []

for user_id, user_song in data.items():
    genres_count = defaultdict(int)  # key:流派，value:数量
    count_of_genres = 0  # 用户流派的数量，可以重复
    for song_id, genres in user_song.items():
        for genre in genres:
            genres_count[genre] += 1
            count_of_genres += 1

    for song_id, genres in user_song.items():
        score = 0
        for genre in genres:
            score += genres_count[genre] / count_of_genres
        records.append([user_id, song_id, score])

df = pd.DataFrame(records, columns=['user_id', 'song_id', 'score'])
reader = Reader(rating_scale=(1, 100))
data = Dataset.load_from_df(df, reader=reader)
train_set = data.build_full_trainset()
algo = SVD()
algo.fit(train_set)


def get_user_songs(user_id):
    return set(df[df['user_id'] == user_id]['song_id'])


def get_recommendations(user_id, n=5):

    user_songs = get_user_songs(user_id)

    # 找出用户没听过的歌
    all_songs = set(df['song_id'].unique())
    print(all_songs, user_songs, sep='\n')
    unheard_songs = all_songs - user_songs
    print(unheard_songs)
    if not unheard_songs:
        return []

    # 对未听过的歌进行预测
    predictions = []
    for song_id in unheard_songs:
        pred = algo.predict(user_id, song_id)
        predictions.append((song_id, pred.est))

    # 按预测评分排序，取前N个
    predictions.sort(key=lambda x: x[1], reverse=True)
    top_n = predictions[:n]
    return [song_id for song_id, _ in top_n]


user_id = 2
recommendations = get_recommendations(user_id, n=10)
print(f"\n为用户 {user_id} 推荐的歌曲ID: {recommendations}")
