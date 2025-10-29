load("render.star", "render")
load("time.star", "time")

def main(config):
    # Create 4 frames for steam animation only
    steam_frames = [
        ["~  ~  ~", " ~   ~ "],
        [" ~ ~ ~ ", "~  ~  ~"],
        ["  ~  ~ ", " ~ ~ ~ "],
        [" ~  ~ ~", "  ~  ~ "],
    ]

    # Build frames with only the steam animating
    frames = []
    for steam in steam_frames:
        frame = render.Box(
            color = "#8B4513",  # Border color
            padding = 1,
            child = render.Box(
                color = "#2d1b00",
                child = render.Row(
                    expanded = True,
                    main_align = "space_around",
                    cross_align = "center",
                    children = [
                    # Coffee beans on left
                    render.Column(
                        cross_align = "center",
                        main_align = "space_around",
                        children = [
                            render.Text(content = "o", color = "#5C4033", font = "tom-thumb"),
                            render.Text(content = "o", color = "#5C4033", font = "tom-thumb"),
                            render.Text(content = "o", color = "#5C4033", font = "tom-thumb"),
                        ],
                    ),
                    # Center: Steam and cup
                    render.Column(
                        main_align = "center",
                        cross_align = "center",
                        children = [
                            # Steam animation
                            render.Column(
                                cross_align = "center",
                                children = [
                                    render.Text(
                                        content = steam[0],
                                        color = "#D3D3D3",
                                        font = "tom-thumb",
                                    ),
                                    render.Text(
                                        content = steam[1],
                                        color = "#C0C0C0",
                                        font = "tom-thumb",
                                    ),
                                ],
                            ),
                            # Coffee cup
                            render.Column(
                                cross_align = "center",
                                children = [
                                    render.Text(
                                        content = " ___",
                                        color = "#FFDEAD",
                                        font = "tom-thumb",
                                    ),
                                    render.Text(
                                        content = "|   |D",
                                        color = "#FFDEAD",
                                        font = "tom-thumb",
                                    ),
                                    render.Text(
                                        content = " \\_/",
                                        color = "#FFDEAD",
                                        font = "tom-thumb",
                                    ),
                                ],
                            ),
                        ],
                    ),
                    # Coffee beans on right
                    render.Column(
                        cross_align = "center",
                        main_align = "space_around",
                        children = [
                            render.Text(content = "o", color = "#5C4033", font = "tom-thumb"),
                            render.Text(content = "o", color = "#5C4033", font = "tom-thumb"),
                            render.Text(content = "o", color = "#5C4033", font = "tom-thumb"),
                        ],
                    ),
                ],
                ),
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 500,  # 500ms per frame = smooth steam animation
        child = render.Animation(
            children = frames,
        ),
    )
