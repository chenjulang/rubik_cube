import ProofWidgets.Component.HtmlDisplay

open Lean ProofWidgets
open scoped ProofWidgets.Jsx

structure RubiksProps where
  seq : Array String := #[]
  deriving ToJson, FromJson, Inhabited

@[widget_module]
def Rubiks : Component RubiksProps where
  javascript := include_str ".." / ".." / "build" / "js" / "rubiks.js"

def eg := #["L", "L", "D⁻¹", "U⁻¹", "L", "D", "D", "L", "U⁻¹",
"R", "D", "F", "F", "D"]

def eg0 := #[""]
def eg1 := #["U"]
def eg2 := #["D"]
def eg3 := #["F"]
def eg4 := #["B"]
def eg5 := #["L"]
def eg6 := #["R"]
def eg7 := #["U⁻¹"]
def eg8 := #["D⁻¹"]
def eg9 := #["F⁻¹"]
def eg10 := #["B⁻¹"]
def eg11 := #["L⁻¹"]
def eg12 := #["R⁻¹"]
def g1 := #["R⁻¹","D","D","R","B⁻¹","U","U","B",  "R⁻¹","D","D","R","B⁻¹","U","U","B"]
--g1可以保持其他块的方向和位置，只改变UFR和DBL的方向，
--分别是UFR的方向+2，DBL的方向的方向+1。
def g2 := #["L","F","R⁻¹","F⁻¹","L⁻¹","U","U","R","U","R","U⁻¹","R","R","U","U","R"]
-- L F R' F' L' U U R U R U' R R U U R

-- 1.全部改成顺时针旋转
-- 2. U要改成B；D改成F；F改成R；B改成L；L改成U；R改成D
-- 3.genstr应该不用改的。

#html <Rubiks seq={eg0} />
#html <Rubiks seq={eg1} /> -- U
#html <Rubiks seq={eg2} /> -- D
#html <Rubiks seq={eg3} /> -- F
#html <Rubiks seq={eg4} /> -- B
#html <Rubiks seq={eg5} /> -- L
#html <Rubiks seq={eg6} /> -- R
#html <Rubiks seq={eg7} />
#html <Rubiks seq={eg8} />
#html <Rubiks seq={eg9} />
#html <Rubiks seq={eg10} />
#html <Rubiks seq={eg11} /> -- L⁻¹
#html <Rubiks seq={eg12} />



#html <Rubiks seq={g1} />
#html <Rubiks seq={g2} />


-- def egTest := #["D⁻¹","F2","U2","F2","U⁻¹","F2","D⁻¹","B2","D⁻¹","U⁻¹","L⁻¹","B","R2","B","D2","F2","U2","R⁻¹","D","U⁻¹"]
def egTest := #["D⁻¹","F2","U2","F2","U⁻¹","F2","D⁻¹","B2","D⁻¹","U⁻¹","L⁻¹"]
#html <Rubiks seq={egTest} />
-- "L⁻¹" 有问题
