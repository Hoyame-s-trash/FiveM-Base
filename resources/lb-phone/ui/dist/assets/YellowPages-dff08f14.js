import{r as s,a as n,j as t}from"./jsx-runtime-7cf68bf7.js";import{u as p,f as r,H as F,q as U,L as a,ah as v,Z as _,C as S,$,U as j,o as A,a6 as q,Y as M,b as V,N as H}from"./Phone-f429e90b.js";function z(){const g=p(V.PhoneNumber),C=p(H),[O,Y]=s.useState(!1),[c,o]=s.useState([]),[f,u]=s.useState(!1),[i,d]=s.useState({}),[w,T]=s.useState(0),[b,E]=s.useState(!1),[G,L]=s.useState(!1),[P,I]=s.useState(""),[N,W]=s.useState(""),[y,x]=s.useState([]);s.useEffect(()=>{const e=setTimeout(()=>I(N),500);return()=>clearTimeout(e)},[N]),s.useEffect(()=>{P.length>0&&r("YellowPages",{action:"search",query:P}).then(e=>{e&&x(e)})},[P]),s.useEffect(()=>{r("YellowPages",{action:"getPosts",page:0}).then(e=>{e&&e.length>0?(o(e),e.length<10&&E(!0)):E(!0)}),r("isAdmin").then(e=>Y(e))},[]);const D=()=>{if(!i.title||!i.description)return;let e={...i,number:g};r("YellowPages",{action:"sendPost",data:e}).then(l=>{l&&(o([{...e,id:l},...c]),u(!1))})},k=e=>{e&&S.PopUp.set({title:a("APPS.YELLOWPAGES.DELETE_POPUP.TITLE"),description:a("APPS.YELLOWPAGES.DELETE_POPUP.TEXT"),buttons:[{title:a("APPS.YELLOWPAGES.DELETE_POPUP.CANCEL")},{title:a("APPS.YELLOWPAGES.DELETE_POPUP.PROCEED"),color:"red",cb:()=>{r("YellowPages",{action:"deletePost",id:e}).then(l=>{l&&o(c.filter(m=>m.id!==e))})}}]})},R=e=>{if(b||G)return;let l=document.querySelector("#last");if(!l)return;!M(l)&&(L(!0),r("YellowPages",{action:"getPosts",page:w+1}).then(h=>{h&&h.length>0?(o([...c,...h]),L(!1)):E(!0)}),T(h=>h+1))};return F("yellowPages:newPost",e=>{settings.airplaneMode||o([e,...c])}),s.useEffect(()=>{d({})},[f]),n("div",{className:"pages-container",children:[t("div",{className:"pages-header",children:t(U,{theme:"light",placeholder:a("APPS.YELLOWPAGES.SEARCH"),onChange:e=>W(e.target.value)})}),t("div",{className:"add",onClick:()=>u(!0),children:t(v,{})}),t("div",{className:"pages-wrapper",children:t("div",{className:"posts",onScroll:R,children:(P.length>0?y:c).map((e,l)=>{let m=l===c.length-1?"last":"";return n("div",{className:"post",id:m,children:[n("div",{className:"post-header",children:[a("APPS.YELLOWPAGES.FROM")," ",_(e.number)]}),n("div",{className:"post-content",children:[n("div",{className:"info",children:[t("div",{className:"title",children:e.title}),t("div",{className:"description",children:e.description})]}),e.attachment&&t("div",{className:"image",onClick:()=>{S.FullScreenImage.set({display:!0,image:e.attachment})},children:t($,{src:e.attachment})})]}),n("div",{className:"post-footer",children:[e.price?t("div",{className:"price",children:C.CurrencyFormat.replace("%s",e.price)}):t("div",{}),n("div",{className:"buttons",children:[t("div",{className:"button",onClick:()=>{window.postMessage({data:{number:e.number,popUp:!0},action:"phone:contact"})},children:a("APPS.YELLOWPAGES.CALL")}),(g===e.number||O)&&t("div",{className:"button red",onClick:()=>k(e.id),children:t(j,{})})]})]})]},l)})})}),f&&n("div",{className:"new-post-container",children:[n("div",{className:"new-post-header",children:[t("div",{className:"cancel",onClick:()=>u(!1),children:a("APPS.YELLOWPAGES.CANCEL")}),t("div",{className:"title",children:a("APPS.YELLOWPAGES.NEW_POST")}),t("div",{})]}),n("div",{className:"new-post-body",children:[n("div",{className:"item",children:[t("div",{className:"title",children:a("APPS.YELLOWPAGES.TITLE")}),t(A,{type:"text",placeholder:a("APPS.YELLOWPAGES.TITLE"),maxLength:50,onChange:e=>d({...i,title:e.target.value})})]}),n("div",{className:"item",children:[t("div",{className:"title",children:a("APPS.YELLOWPAGES.DESCRIPTION")}),t(q,{type:"text",placeholder:a("APPS.YELLOWPAGES.DESCRIPTION"),maxLength:250,rows:5,onChange:e=>d({...i,description:e.target.value})})]}),t("div",{className:"item",children:t("div",{className:"image",style:{backgroundImage:`url(${i.attachment})`},onClick:()=>{S.Gallery.set({onSelect:e=>d({...i,attachment:e.src})})},children:t(v,{})})}),n("div",{className:"item",children:[t("div",{className:"title",children:a("APPS.YELLOWPAGES.PRICE")}),t(A,{type:"number",placeholder:"0",onChange:e=>{if(!e.target.value.match(/^[0-9]*$/))return e.preventDefault();d({...i,price:!isNaN(e.target.value)&&e.target.value})}})]}),t("div",{className:"button",onClick:()=>D(),children:a("APPS.YELLOWPAGES.POST")})]})]})]})}export{z as default};
