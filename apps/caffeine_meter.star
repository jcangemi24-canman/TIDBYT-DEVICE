load("render.star", "render")

def main(config):
    # 5 frames showing caffeine depleting
    caffeine_levels = [
        {"bars": "||||||||||", "status": "WIRED", "color": "#00FF00"},  # Full - bright green
        {"bars": "||||||||--", "status": "WIRED", "color": "#7FFF00"},  # 80% - yellow-green
        {"bars": "||||||----", "status": "FADING", "color": "#FFD700"},  # 60% - gold
        {"bars": "||||------", "status": "FADING", "color": "#FFA500"},  # 40% - orange
        {"bars": "||--------", "status": "LOW!", "color": "#FF4500"},  # 20% - red-orange
    ]

    frames = []
    for level in caffeine_levels:
        frame = render.Box(
            color = "#8B4513",  # Border color
            padding = 1,
            child = render.Box(
                color = "#2d1b00",
                child = render.Column(
                    expanded = True,
                    main_align = "space_around",
                    cross_align = "center",
                    children = [
                    # Title
                    render.Text(
                        content = "CAFFEINE",
                        color = "#FFD700",
                        font = "tom-thumb",
                    ),
                    # Meter display
                    render.Box(
                        padding = 1,
                        child = render.Text(
                            content = "[" + level["bars"] + "]",
                            color = level["color"],
                            font = "tom-thumb",
                        ),
                    ),
                    # Status text
                    render.Text(
                        content = level["status"],
                        color = level["color"],
                        font = "tom-thumb",
                    ),
                    # Coffee cup decoration
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
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 1000,  # 1 second per frame = 5 seconds to go from full to empty
        child = render.Animation(
            children = frames,
        ),
    )
