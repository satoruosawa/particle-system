public class Scene {
  private static boolean wasTransition = false;
  private static int transitionAt = 150000;
  private static float transitionLevel = 0;
  private static boolean wasClickStart = false;

  private Scene() {
  }

  public static void update() {
    if (!wasTransition && Ticker.elapsedTime() > transitionAt) {
      wasTransition = true;
    }
    if (wasTransition && transitionLevel < 1) {
      transitionLevel += 0.02;
    }
  }

  public static int transition(int before, int after) {
    return (int)(after * transitionLevel + before * (1.0 - transitionLevel));
  }

  public static boolean wasTransition() {
    return wasTransition;
  }

  public static void clickStart() {
    wasClickStart = true;
  }

  public static boolean wasClickStart() {
    return wasClickStart;
  }
}
