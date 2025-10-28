load("render.star", "render")
load("time.star", "time")

def main():
    now = time.now()

    # Get minutes within the hour (0-59)
    # At minute 0, bar is full (60). As minutes pass, bar depletes
    minutes_passed = now.minute

    # Calculate remaining "caffeine" - depletes over 60 minutes
    remaining_minutes = 60 - minutes_passed

    # Calculate percentage and bar level (0-10 bars)
    percentage = int((remaining_minutes / 60.0) * 100)
    bar_level = int((remaining_minutes / 60.0) * 10)

    # Build the bar string
    bar_filled = "█" * bar_level
    bar_empty = "░" * (10 - bar_level)
    bar_display = bar_filled + bar_empty

    # Determine color and status based on level
    if percentage >= 67:
        color = "#00FF00"  # Green
        status = "WIRED"
    elif percentage >= 34:
        color = "#FFA500"  # Orange
        status = "FADING"
    else:
        color = "#FF0000"  # Red
        status = "LOW!"

    return render.Root(
        delay = 100,
        child = render.Box(
            color = "#0a0a0a",
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Title
                    render.Text(
                        content = "CAFFEINE",
                        color = "#FFDEAD",
                        font = "tom-thumb",
                    ),
                    # Status
                    render.Text(
                        content = status,
                        color = color,
                        font = "6x13",
                    ),
                    # Bar display
                    render.Text(
                        content = bar_display,
                        color = color,
                        font = "tom-thumb",
                    ),
                    # Percentage
                    render.Text(
                        content = "%d%%" % percentage,
                        color = color,
                        font = "tom-thumb",
                    ),
                ],
            ),
        ),
    )
