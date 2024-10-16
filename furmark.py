import pyautogui as p
from PIL import ImageGrab
import time
import keyboard
time.sleep(5)
p.moveTo(1069,571)
p.click()
p.moveTo(1072,541)
p.click()
p.moveTo(1108,608)
time.sleep(5)
p.click()
time.sleep(240)
snapshot=ImageGrab.grab()
save_path = "C:\\Users\\Owner\\Documents\\furmarkscreenshot.png"
snapshot.save(save_path, "PNG")
keyboard.press_and_release("esc")
keyboard.press_and_release("esc")




