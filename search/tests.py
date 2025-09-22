import surprise
from surprise import Reader, Dataset
from surprise import SVD
import pandas as pd
from collections import defaultdict
import numpy as np

# 🧊 模拟数据：用户ID -> 歌曲ID -> 歌曲流派列表
user_song_genres = {
    1: {
        101: ['轻音乐', '古典音乐'],
        102: ['摇滚', '流行'],
        103: ['轻音乐']
    },
    2: {
        101: ['轻音乐', '古典音乐'],
        104: ['民谣', '乡村音乐']
    },
    3: {
        102: ['摇滚', '流行'],
        105: ['电子音乐', '舞曲']
    }
}

# 🎵 构造评分数据，每个流派算1分（粗略模拟偏好）
records = []
for user_id, user_songs in user_song_genres.items():
    for song_id, genres in user_songs.items():
        score = len(genres)  # 一个简单评分：流派个数 = 分数
        records.append([user_id, song_id, score])

# 🧃 转换为 DataFrame
df = pd.DataFrame(records, columns=['user', 'item', 'rating'])
print("原始评分数据：\n", df)

# 🧙‍♂️ 创建 Reader，设定评分范围
reader = Reader(rating_scale=(1, 5))

# 📚 加载数据集
data = Dataset.load_from_df(df, reader=reader)

# 🛠 构建训练集
trainset = data.build_full_trainset()

# 🔮 使用 SVD 算法进行训练
algo = SVD()
algo.fit(trainset)


# 🧩 获取某用户听过的歌曲集合
def get_user_songs(user_id):
    return set(user_song_genres.get(user_id, {}).keys())


# 🎁 为某个用户生成推荐歌曲
def get_recommendations(user_id, n=5):
    user_songs = get_user_songs(user_id)

    # 找出用户没听过的歌
    all_songs = {song for songs in user_song_genres.values() for song in songs}
    unheard_songs = all_songs - user_songs

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


# 🎉 示例：为用户1生成推荐
user_id = 1
print(data)
recommendations = get_recommendations(user_id)
print(f"\n为用户 {user_id} 推荐的歌曲ID: {recommendations}")
