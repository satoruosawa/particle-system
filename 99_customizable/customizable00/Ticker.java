import processing.core.*;

public class Ticker {
  private static PApplet pApplet = new PApplet();
  private static Ticker ticker = new Ticker();
  private static int elapsedTime = 0;
  private static boolean isPlay = true;
  private static int lastUpdateAt = 0;
  private static int deltaTime = 0;

  private Ticker() {}

  public static void update() {
    int now = pApplet.millis();
    if (isPlay) {
     deltaTime =  now - lastUpdateAt;
     elapsedTime += deltaTime;
    }
    lastUpdateAt = now;
  }

  public static void play() {
   isPlay = true;
   lastUpdateAt = pApplet.millis();
  }
  public static void pause() { isPlay = false; }

  public static boolean isPlay() { return isPlay; }
  public static int elapsedTime() { return elapsedTime; }
  public static float elapsedTimeF() { return (float)elapsedTime; }
  public static float deltaTimeF() { return (float)deltaTime; }
}
