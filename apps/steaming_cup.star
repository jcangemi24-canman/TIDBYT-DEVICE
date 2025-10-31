load("render.star", "render")
load("time.star", "time")

def main(config):
    # Create 4 frames for steam animation - rising vertically with curvy motion
    steam_frames = [
        [" ) ( ", "( ) "],
        ["( ) ", " ) ( "],
        [" ) ( ", "( ) "],
        ["( ) ", " ) ( "],
    ]

    # Build frames with steam animating
    frames = []
    for steam in steam_frames:
        frame = render.Box(
            width = 64,
            height = 32,
            color = "#000000",
            child = render.Column(
                expanded = True,
                main_align = "center",
                cross_align = "center",
                children = [
                    # Steam rising
                    render.Column(
                        cross_align = "center",
                        children = [
                            render.Text(
                                content = steam[0],
                                color = "#C0C0C0",
                                font = "tom-thumb",
                            ),
                            render.Text(
                                content = steam[1],
                                color = "#D3D3D3",
                                font = "tom-thumb",
                            ),
                        ],
                    ),
                    # Coffee mug with smiley
                    render.Column(
                        cross_align = "center",
                        children = [
                            render.Text(
                                content = " _______",
                                color = "#FFFFFF",
                                font = "tom-thumb",
                            ),
                            render.Text(
                                content = "|       |)",
                                color = "#FFFFFF",
                                font = "tom-thumb",
                            ),
                            render.Text(
                                content = "| o   o |)",
                                color = "#8B4513",
                                font = "tom-thumb",
                            ),
                            render.Text(
                                content = "|  \\_/  |",
                                color = "#8B4513",
                                font = "tom-thumb",
                            ),
                            render.Text(
                                content = "|_______|",
                                color = "#FFFFFF",
                                font = "tom-thumb",
                            ),
                        ],
                    ),
                ],
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 500,  # 500ms per frame = smooth steam animation
        child = render.Animation(
            children = frames,
        ),
    )
