export function composite(foreground, background) {
    const alpha = foreground.a;
    return {
        r: foreground.r * alpha + background.r * (1 - alpha),
        g: foreground.g * alpha + background.g * (1 - alpha),
        b: foreground.b * alpha + background.b * (1 - alpha),
        a: 1
    };
}

function channel(value) {
    return value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4);
}

export function luminance(color) {
    return 0.2126 * channel(color.r) + 0.7152 * channel(color.g) + 0.0722 * channel(color.b);
}

export function ratio(foreground, background) {
    const opaque = composite(foreground, background);
    const lighter = Math.max(luminance(opaque), luminance(background));
    const darker = Math.min(luminance(opaque), luminance(background));
    return (lighter + 0.05) / (darker + 0.05);
}
