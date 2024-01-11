import ProofWidgets.Component.HtmlDisplay

open Lean ProofWidgets
open scoped ProofWidgets.Jsx

structure RubiksProps where
  seq : Array String := #[]
  deriving ToJson, FromJson, Inhabited

@[widget_module]
def Rubiks : Component RubiksProps where
  javascript := include_str ".." / ".." / "build" / "js" / "rubiks.js"

-- def eg := #["L", "L", "D⁻¹", "U⁻¹", "L", "D", "D", "L", "U⁻¹",
-- "R", "D", "F", "F", "D"]

def eg0 := #[""]
def eg1 := #["L"]
def eg2 := #["L⁻¹"]
def eg3 := #["R"]
def eg4 := #["R⁻¹"]
def eg5 := #["U"]
def eg6 := #["U⁻¹"]
def eg7 := #["D"]
def eg8 := #["D⁻¹"]
def eg9 := #["F"]
def eg10 := #["F⁻¹"]
def eg11 := #["B"]
def eg12 := #["B⁻¹"]


#html <Rubiks seq={eg0} />
#html <Rubiks seq={eg1} />
#html <Rubiks seq={eg2} />
#html <Rubiks seq={eg3} />
#html <Rubiks seq={eg4} />
#html <Rubiks seq={eg5} />
#html <Rubiks seq={eg6} />
#html <Rubiks seq={eg7} />
#html <Rubiks seq={eg8} />
#html <Rubiks seq={eg9} />
#html <Rubiks seq={eg10} />
#html <Rubiks seq={eg11} />
