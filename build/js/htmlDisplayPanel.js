window;import{jsx as e,Fragment as n,jsxs as t}from"react/jsx-runtime";import*as r from"react";import{DynamicComponent as o}from"@leanprover/infoview";function s({pos:i,html:m}){if("text"in m)return e(n,{children:m.text});if("element"in m){const[n,t,o]=m.element,p={};for(const[e,n]of t)p[e]=n;const l=o.map((e=>s({pos:i,html:e})));return"hr"===n?e("hr",{}):0===l.length?r.createElement(n,p):r.createElement(n,p,l)}if("component"in m){const[t,r,p]=m.component,l=p.map((e=>s({pos:i,html:e}))),a={...r,pos:i};return 0===l.length?e(o,{pos:i,hash:t,props:a}):e(o,{pos:i,hash:t,props:a,children:e(n,{children:l})})}return t("span",{className:"red",children:["Unknown HTML: ",JSON.stringify(m)]})}function i({pos:n,html:r}){return t("details",{open:!0,children:[e("summary",{className:"mv2 pointer",children:"HTML Display"}),e(s,{pos:n,html:r})]})}export{i as default};
