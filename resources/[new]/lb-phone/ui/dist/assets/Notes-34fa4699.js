import{r as E,j as e,F as p,a as i}from"./jsx-runtime-bb820e81.js";import{u as A,h as d,f as S,L as n,q as L,r as P,J as g,o as k,a6 as D,au as I,C as b,ab as w,b as x}from"./Phone-a7ab6193.js";function j(){const T=A(x.Settings),[l,v]=E.useState(""),[c,N]=E.useState([]),[s,r]=E.useState({});E.useEffect(()=>{if(d.APPS.NOTES.notes.value)return N(d.APPS.NOTES.notes.value);S("Notes",{action:"fetch"}).then(t=>{N(t),d.APPS.NOTES.notes.set(t)})},[]);const O=t=>{let a=Math.floor(Date.now()),o={title:n("APPS.NOTES.NEW_NOTE"),content:"",timestamp:a};S("Notes",{action:"create",data:o}).then(m=>{o.id=m,r(o),N([...c,o]),d.APPS.NOTES.notes.set({...c,tempData:o})})},h=t=>{let a=Math.floor(Date.now()),o=[...c],m=o.findIndex(C=>C.id===t),u=o[m];u={id:s.id,title:s.title,content:s.content,timestamp:a},o[m]=u,S("Notes",{action:"save",data:u}),r({}),N(o),d.APPS.NOTES.notes.set(o)},f=t=>{let a=[...c];S("Notes",{action:"remove",data:a[t-1]}),a.splice(t-1,1),r({}),N(a),d.APPS.NOTES.notes.set(a)};return e(p,{children:Object.keys(s).length===0?i("div",{className:"notes-container slide-right",children:[e("div",{className:"title",children:n("APPS.NOTES.TITLE")}),e(L,{placeholder:n("APPS.NOTES.SEARCH_PLACEHOLDER"),onChange:t=>v(t.target.value)}),e("div",{className:"notes-body",children:e("div",{className:"notes-list",children:c.filter(t=>{var a,o;return((a=t.title)==null?void 0:a.toLowerCase().includes(l==null?void 0:l.toLowerCase()))||((o=t.content)==null?void 0:o.toLowerCase().includes(l==null?void 0:l.toLowerCase()))}).sort((t,a)=>a.timestamp-t.timestamp).map((t,a)=>i("div",{className:"note-item",onClick:()=>{r(t)},children:[e("div",{className:"note-title",children:t.title}),i("div",{className:"note-details",children:[e("div",{className:"date",children:P(t.timestamp,T.time.twelveHourClock)}),e("div",{className:"content",children:t.content.length>30?t.content.slice(0,30)+"...":t.content})]})]},a))})}),i("div",{className:"notes-bottom",children:[e("div",{}),e("div",{className:"amount",children:n("APPS.NOTES.FOOTER").format({amount:c.length})}),e(g,{onClick:O})]})]}):i("div",{className:"notes-container slide-left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>h(s.id),children:[e("i",{className:"fal fa-chevron-left"}),n("APPS.NOTES.TITLE")]}),e(k,{className:"title",defaultValue:s.title,onChange:t=>{r({...s,title:t.target.value})}}),e("div",{})]}),e(D,{onChange:t=>{r({...s,content:t.target.value})},defaultValue:s.content}),i("div",{className:"notes-bottom",children:[e(I,{onClick:()=>b.PopUp.set({title:n("APPS.NOTES.DELETE_TITLE").format({title:s.title}),description:n("APPS.NOTES.DELETE_TEXT").format({title:s.title}),buttons:[{title:n("APPS.NOTES.BUTTON_CANCEL")},{title:n("APPS.NOTES.BUTTON_DELETE"),color:"red",cb:()=>{f(s.id)}}]})}),e("div",{className:"amount",children:n("APPS.NOTES.LAST_EDITED").format({date:P(s.timestamp,T.time.twelveHourClock)})}),e(w,{onClick:()=>h(s.id)})]})]})})}export{j as default};
