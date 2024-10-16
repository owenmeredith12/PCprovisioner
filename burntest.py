import pyautogui as p
from PIL import ImageGrab
import time
import keyboard
time.sleep(5)
p.moveTo(936,414)
p.click()
p.moveTo(909,444)
p.click()
p.moveTo(1124,400)
p.click()
time.sleep(950)
snapshot=ImageGrab.grab()
save_path = "C:\\Users\\Owner\\Documents\\burntestscreenshot.png"
snapshot.save(save_path, "PNG")