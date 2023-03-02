
import tkinter as tk

class Light:
    def __init__(self, master):
        self.master = master
        self.canvas = tk.Canvas(master, width=50, height=50)
        self.canvas.pack()
        self.color = "red"
        self.draw()

    def draw(self):
        self.canvas.create_oval(10, 10, 40, 40, fill=self.color)

    def flash_green(self):
        self.color = "green"
        self.draw()
        self.master.after(500, self.turn_off)

    def turn_off(self):
        self.color = "red"
        self.draw()

class GUI:
    def __init__(self, master):
        self.master = master
        self.light = Light(master)
        self.button = tk.Button(master, text="Press Me", command=self.light.flash_green)
        self.button.pack()

root = tk.Tk()
gui = GUI(root)
root.mainloop()



'''
import tkinter as tk
import random

class FlashingLight(tk.Canvas):
    def __init__(self, master=None, **kwargs):
        super().__init__(master, **kwargs)
        self.create_oval(10, 10, 90, 90, fill='black', outline='')
        self._flash()

    def _flash(self):
        fill = self.itemcget(1, 'fill')
        if fill == 'green':
            self.itemconfig(1, fill='red')
        else:
            self.itemconfig(1, fill='green')
        self.after(random.randint(100, 1000), self._flash)

root = tk.Tk()
root.title('LockerSystem')

lights = []
for i in range(10):
    light = FlashingLight(root, width=100, height=100)
    light.grid(row=0, column=i)
    lights.append(light)

root.mainloop()

'''










