// Lean compiler output
// Module: ProofWidgets
// Imports: Init ProofWidgets.Component.Basic ProofWidgets.Component.HtmlDisplay ProofWidgets.Component.InteractiveSvg ProofWidgets.Component.PenroseDiagram ProofWidgets.Data.Html ProofWidgets.Data.Json ProofWidgets.Data.Svg ProofWidgets.Presentation.Expr ProofWidgets.Presentation.Goal
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Component_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Component_HtmlDisplay(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Component_InteractiveSvg(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Component_PenroseDiagram(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Data_Html(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Data_Json(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Data_Svg(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Presentation_Expr(uint8_t builtin, lean_object*);
lean_object* initialize_ProofWidgets_Presentation_Goal(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_ProofWidgets(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Component_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Component_HtmlDisplay(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Component_InteractiveSvg(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Component_PenroseDiagram(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Data_Html(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Data_Json(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Data_Svg(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Presentation_Expr(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_ProofWidgets_Presentation_Goal(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
