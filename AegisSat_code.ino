#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <DHT.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

// Pins
#define DHTPIN 15
#define DHTTYPE DHT11

#define BUZZER_PIN 16
#define RELAY_PIN 17

#define GREEN_LED 18
#define YELLOW_LED 19
#define RED_LED 20

#define CURRENT_SENSOR 26
#define VOLTAGE_SENSOR 27
#define SOLAR_SENSOR 28

DHT dht(DHTPIN, DHTTYPE);

unsigned long startTime;

void setup()
{
  Serial.begin(115200);

  pinMode(BUZZER_PIN, OUTPUT);
  pinMode(RELAY_PIN, OUTPUT);

  pinMode(GREEN_LED, OUTPUT);
  pinMode(YELLOW_LED, OUTPUT);
  pinMode(RED_LED, OUTPUT);

  Wire.setSDA(0);
  Wire.setSCL(1);
  Wire.begin();

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C))
  {
    while (1);
  }

  dht.begin();

  startTime = millis();

  digitalWrite(RELAY_PIN, HIGH);
}

void loop()
{
  // DHT11
  float temp = dht.readTemperature();
  float hum = dht.readHumidity();

  if (isnan(temp)) temp = 0;
  if (isnan(hum)) hum = 0;

  // Battery Voltage
  int voltageRaw = analogRead(VOLTAGE_SENSOR);

  float batteryVoltage = voltageRaw * 0.0116;

  // Solar Panel
  int solarRaw = analogRead(SOLAR_SENSOR);

  String solarStatus;

  if (solarRaw < 500)
    solarStatus = "ECLIPSE";
  else
    solarStatus = "SUN";

  // Mission Timer
  unsigned long missionTime =
      (millis() - startTime) / 1000;

  // LEDs
  digitalWrite(GREEN_LED, LOW);
  digitalWrite(YELLOW_LED, LOW);
  digitalWrite(RED_LED, LOW);

  if (batteryVoltage > 3.7)
  {
    digitalWrite(GREEN_LED, HIGH);
  }
  else if (batteryVoltage > 3.3)
  {
    digitalWrite(YELLOW_LED, HIGH);
  }
  else
  {
    digitalWrite(RED_LED, HIGH);
  }

  // Buzzer
  if (temp > 35)
  {
    digitalWrite(BUZZER_PIN, HIGH);
  }
  else
  {
    digitalWrite(BUZZER_PIN, LOW);
  }

  // Relay
  if (batteryVoltage < 3.0)
  {
    digitalWrite(RELAY_PIN, LOW);
  }
  else
  {
    digitalWrite(RELAY_PIN, HIGH);
  }

  // OLED DISPLAY
  display.clearDisplay();

  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);

  // Title
  display.setCursor(35, 0);
  display.println("AegisSat");

  display.drawLine(0, 10, 128, 10, SSD1306_WHITE);

  // Temperature
  display.setCursor(0, 14);
  display.print("Temp: ");
  display.print(temp);
  display.println(" C");

  // Humidity
  display.setCursor(0, 24);
  display.print("Hum : ");
  display.print(hum);
  display.println("%");

  // Battery
  display.setCursor(0, 34);
  display.print("Bat : ");
  display.print(batteryVoltage);
  display.println("V");

  // Solar
  display.setCursor(0, 44);
  display.print("Solar:");
  display.print(solarStatus);
  

  // Timer
  display.setCursor(0, 54);
  display.print("Time:");
  display.print(missionTime);
  display.print("s");

  display.display();

  // Serial Monitor
  Serial.print("Temp=");
  Serial.print(temp);

  Serial.print(" Hum=");
  Serial.print(hum);

  Serial.print(" Bat=");
  Serial.print(batteryVoltage);

  Serial.print(" Solar=");
  Serial.print(solarRaw);

  Serial.print(" ");
  Serial.println(solarStatus);

  delay(1000);
}