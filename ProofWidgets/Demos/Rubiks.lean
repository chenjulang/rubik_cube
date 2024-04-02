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

-- def correct_move : String → String :=
--     fun x =>
--       if x = "U" then "L"
--       else if x = "D" then "R3"
--       else if x = "F" then "D"
--       else if x = "B" then "U3"
--       else if x = "L" then "B"
--       else if x = "R" then "F3"
--       else if x = "U⁻¹" then "L⁻¹"
--       else if x = "D⁻¹" then "R"
--       else if x = "F⁻¹" then "D⁻¹"
--       else if x = "B⁻¹" then "U"
--       else if x = "L⁻¹" then "B⁻¹"
--       else if x = "R⁻¹" then "F"
--       else ""

-- def corrMoveFunc: Array String →  Array String :=
--   fun l => (l.map correct_move)

-- #eval eg
-- #eval corrMoveFunc eg

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
-- U →  L 实际效果：U
-- D →  R 实际效果：D' →  R3 实际效果：D
-- F →  D 实际效果：F
-- B →  U 实际效果：B' →  U3 实际效果：B
-- L →  B 实际效果：L
-- R →  F 实际效果：R' →  F3 实际效果：R



#html <Rubiks seq={eg0} /> -- 1
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


def egTest := #["D⁻¹", "F", "F", "U", "U", "F", "F", "U⁻¹", "F", "F", "D⁻¹", "B", "B", "D⁻¹", "U⁻¹", "L⁻¹", "B", "R", "R", "B", "D", "D", "F", "F", "U", "U", "R⁻¹", "D", "U⁻¹"]
#html <Rubiks seq={eg0} /> -- 1
#html <Rubiks seq={egTest} />

def OddToEven := #["R", "U", "R⁻¹", "F⁻¹", "R", "U", "R⁻¹", "U⁻¹", "R⁻¹", "F", "R", "R", "U⁻¹", "R⁻¹", "U⁻¹"]
def solve_Corner_Orient := #["D", "R'", "D", "D", "R", "B'", "U", "U", "B", "R'", "D", "D", "R", "B'", "U", "U", "B", "D'",
  "U'", "D", "R'", "D", "D", "R", "B'", "U", "U", "B", "R'", "D", "D", "R", "B'", "U", "U", "B", "D'", "U",
  "U", "D'", "R'", "D", "D", "R", "B'", "U", "U", "B", "R'", "D", "D", "R", "B'", "U", "U", "B", "D", "U'",
  "D'", "R'", "D", "D", "R", "B'", "U", "U", "B", "R'", "D", "D", "R", "B'", "U", "U", "B", "D",
  "D", "D", "R'", "D", "D", "R", "B'", "U", "U", "B", "R'", "D", "D", "R", "B'", "U", "U", "B", "D", "D", "D", "D", "R'", "D", "D", "R", "B'", "U", "U", "B", "R'", "D", "D", "R", "B'", "U", "U", "B", "D", "D"]
def solve_Corner_Permute := #["L", "L", "R'", "F'", "F'", "F'", "R'", "B", "B", "R'", "R'", "R'", "F'", "R'", "B", "B", "R'", "R'", "L'", "L'", "D", "L'", "D'", "F", "F", "L", "F", "F", "R'", "R'", "F", "L", "F", "F", "F", "R'", "R'", "F", "L", "L", "L", "F", "L'", "F", "F", "D", "L", "D'", "F", "F", "R'", "R'", "F", "L", "F", "F", "F", "R'", "R'", "F", "L", "L", "L", "F", "R", "R", "B'", "R'", "R'", "R'", "B'", "L", "L", "B'", "B'", "B'", "R'", "B'", "L", "L", "B'", "B'", "R'", "R'"]
def solve_Edge_Permute := #["D'", "L", "L", "R'", "R'", "U", "R", "U", "R'", "U'", "R'", "U'", "R'", "U", "R'", "L'", "L'", "D", "F", "F", "B", "U'", "B", "U", "B", "U", "B", "U'", "B'", "U'", "B", "B", "F'", "F'", "F", "R", "U'", "R", "U", "R", "U", "R", "U'", "R'", "U'", "R", "R", "F'", "U'", "L", "L", "U", "B'", "F'", "F'", "U", "F", "U", "F'", "U'", "F'", "U'", "F'", "U", "F'", "B", "U'", "L'", "L'", "U"]
#html <Rubiks seq={egTest} /> -- 初始问题状态
#html <Rubiks seq={egTest ++ solve_Corner_Orient} /> -- 颜色还原
#html <Rubiks seq={egTest ++ OddToEven ++ solve_Corner_Permute} /> -- 角块位置还原
#html <Rubiks seq={egTest ++ OddToEven ++ solve_Edge_Permute} /> -- 棱块位置还原
#html <Rubiks seq={egTest ++ OddToEven ++ solve_Corner_Permute ++ solve_Edge_Permute} /> -- 角块+棱块位置还原
#html <Rubiks seq={egTest ++ solve_Corner_Orient ++ OddToEven ++ solve_Corner_Permute ++ solve_Edge_Permute} /> -- 全体还原
