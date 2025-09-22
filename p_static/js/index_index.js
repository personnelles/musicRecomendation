let ele = null
$(document).ready(function () {
    $(".cc-xxxx").on("click", async function (e) {
        const $button = $(this);
        const id = $button.data("index");
        const op = $button.data("op");
        try {
            const response = await $.ajax({
                url: `collect_song/${id}`,
                method: "POST",
                headers: {
                    "X-CSRFToken": "{{ csrf_token }}",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({song_id: id, op})
            });
            alert(response.message);
            $button.data("op", response.op);
            $button.html(`<i class="fas ${response.op === "D" ? "fa-heart-broken" : "fa-heart"} me-2"></i>${response.text}`);
            $button.attr("class", `cc-xxxx btn btn-custom ${response.op === "D" ? "btn-warning" : "btn-success"}`);
        } catch (error) {
            alert("操作失败，请稍后重试");
        }
    });
    let cur_button = null
    const audio_div = document.getElementById('div-play-music')
    const audio_ele = document.getElementById('audio-play-music')


    $("#upload-avatar").on('click', async function (e) {
        console.log(e)
    })

    const soundwave = document.querySelector('.soundwave');
    $(".audio-player").on("pause", async function (e) {
        cur_button.disabled = false
        soundwave.classList.remove("running");
        const icon = cur_button.querySelector('i');
        if (icon) {
            icon.classList.remove('fa-pause');
            icon.classList.add('fa-play');
            cur_button.innerHTML = '<i class="fas fa-play me-2"></i>播放';
        }

    })

    $(".audio-player").on("play", async function (e) {
        const $audio = $(this);

        const id = $audio.data("index");
        try {
            const response = await $.ajax({
                url: `play_song/${id}`,
                method: "POST",
                headers: {
                    "X-CSRFToken": "{{ csrf_token }}",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({song_id: id})
            });
            soundwave.classList.add("running");
        } catch (error) {
            alert("操作失败，请稍后重试");
        }
    })


    $('.play-music-button').on('click', async function (e) {
        const source = e.target
        audio_ele.dataset.index = source.dataset.index
        audio_ele.src = source.dataset.src
        cur_button = source
        cur_button.disabled = true
        await audio_ele.play()
        document.getElementById("current-song-title").innerText = source.dataset.name;
        console.log(cur_button)

        const icon = cur_button.querySelector('i');
        if (icon) {
            icon.classList.remove('fa-play');
            icon.classList.add('fa-pause');
            cur_button.innerHTML = '<i class="fas fa-pause me-2"></i>播放中...';
        }

    })
    ele = audio_ele

});