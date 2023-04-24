export function playAudio(path: string, volume: number = 0.025) {
    const d = new Audio(path);
    d.volume = volume;
    d.play();
}