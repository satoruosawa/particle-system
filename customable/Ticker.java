import processing.core.*;

public class Ticker {
  private static PApplet p5_ = new PApplet();
  private static Ticker ticker_ = new Ticker();
  private static int elapsed_time_ = 0;
  private static boolean is_play_ = true;
  private static int last_update_at_ = 0;
  private static int delta_time_ = 0;

  private Ticker() {
    elapsed_time_ = 0;
    is_play_ = false;
    last_update_at_ = 0;
  }

  public static void update() {
    int now = p5_.millis();
    if (is_play_) {
     delta_time_ =  now - last_update_at_;
     elapsed_time_ += delta_time_;
    }
    last_update_at_ = now;
  }

  // control
  public static void play() {
   is_play_ = true;
   last_update_at_ = p5_.millis();
  }
  public static void pause() { is_play_ = false; }

  // getter
  public static boolean isPlay() { return is_play_; }
  public static int elapsedTime() { return elapsed_time_; }
  public static float elapsedTimeF() { return (float)elapsed_time_; }
  public static float deltaTimeF() { return (float)delta_time_; }
}
