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

-- 还是有bug，只能保持角度，更换次数。

def egTest := #["D⁻¹", "F", "F", "U", "U", "F", "F", "U⁻¹", "F", "F", "D⁻¹", "B", "B", "D⁻¹", "U⁻¹", "L⁻¹", "B", "R", "R", "B", "D", "D", "F", "F", "U", "U", "R⁻¹", "D", "U⁻¹"]
-- #["R", "D", "D", "L", "L", "D", "D", "L⁻¹", "D", "D", "R", "U3", "U3", "R", "L⁻¹", "B⁻¹", "U3", "F3", "F3", "U3", "R3",
  -- "R3", "D", "D", "L", "L", "F", "R3", "L⁻¹"]
-- def egTest := #["D","D","D","F","F","U","U","F","F","U","U","U","F"]
#html <Rubiks seq={eg0} /> -- 1
--todo
#html <Rubiks seq={egTest} />
-- 不改源码，我改自己行了吧！！！

  -- OddToEven: R U R' F' R U R' U' R' F R R U' R' U' // R,U,R⁻¹,F⁻¹,R,U,R⁻¹,U⁻¹,R⁻¹,F,R,R,U⁻¹,R⁻¹,U⁻¹
  -- solve_Corner_Orient: (conj D G1Perm)
    -- * (conj (U'*D) G1Perm)
    -- * (conj (U*D') G1Perm)
    -- * (conj D' G1Perm)
    -- * (conj D2 G1Perm) * (conj D2 G1Perm)
  -- solve_Corner_Permute: ((conj R2 (VarR G4Perm_List)⁻¹)
    -- * (VarL G4Perm_List)
    -- * (conj (D*L'*D'*F2*L) (VarL G4Perm_List))
    -- * (conj L2 (G4Perm)⁻¹))⁻¹
  -- solve_Edge_Permute
    --   ((conj (U'*L2*U*B') (VarL G3Perm_List))
    -- * (conj F (G3Perm)⁻¹)
    -- * (conj F2 (VarR G3Perm_List)⁻¹)
    -- * (conj (D'*L2) G3Perm))⁻¹
