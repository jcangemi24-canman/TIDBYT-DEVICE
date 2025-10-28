load("render.star", "render")
load("time.star", "time")

def main():
    now = time.now()

    # Pulsing border colors (alternates every 2 seconds)
    pulse_colors = [
        "#FFD700",  # Gold
        "#FFA500",  # Orange
    ]
    pulse_index = (now.unix // 2) % len(pulse_colors)
    border_color = pulse_colors[pulse_index]

    # Rotating emojis every 2 seconds
    emojis = [
        "☕",  # Coffee cup
        "✨",  # Sparkles
        "💛",  # Yellow heart
        "🌟",  # Star
    ]
    emoji_index = (now.unix // 2) % len(emojis)
    current_emoji = emojis[emoji_index]

    return render.Root(
        delay = 100,
        child = render.Box(
            color = "#1a0f00",
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Top pulsing border
                    render.Box(
                        width = 60,
                        height = 2,
                        color = border_color,
                    ),
                    # Top emoji
                    render.Text(
                        content = current_emoji,
                        font = "tom-thumb",
                    ),
                    # Main message - line 1
                    render.Text(
                        content = "COFFEE",
                        color = "#FFDEAD",
                        font = "6x13",
                    ),
                    # Main message - line 2
                    render.Text(
                        content = "FIXES",
                        color = "#FFD700",
                        font = "6x13",
                    ),
                    # Main message - line 3
                    render.Text(
                        content = "EVERYTHING",
                        color = "#FFDEAD",
                        font = "tom-thumb",
                    ),
                    # Bottom emoji
                    render.Text(
                        content = current_emoji,
                        font = "tom-thumb",
                    ),
                    # Bottom pulsing border
                    render.Box(
                        width = 60,
                        height = 2,
                        color = border_color,
                    ),
                ],
            ),
        ),
    )
