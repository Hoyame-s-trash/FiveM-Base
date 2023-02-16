import{r as S,j as e,a as t,F as I}from"./jsx-runtime-bb820e81.js";import{o as z,u as g,b as N,Q as L,L as s,ab as b,d as w,ac as Z,ad as j,M as y,N as R,ae as Q,af as J,ag as ee,ah as X,C as O,ai as Y,aj as se,ak as q,B,c as W,f as A,I as F,j as M,al as te,A as ae,l as ie,am as ne,z as le,an as ce,ao as re,ap as oe,aq as de,ar as Se,as as Pe,at as Ne,q as Te,i as me}from"./Phone-a7ab6193.js";import{S as U}from"./Switch-81fd1e85.js";import{C as he}from"./Check-44f46e76.js";import{N as x}from"./Numpad-68ff3ca2.js";function H(a){const[l,r]=S.useState(a.value),[n,c]=S.useState($(l,a.min,a.max));return e(z,{type:"range",className:"sliderInput",min:a.min,max:a.max,defaultValue:l,step:a.step,onChange:d=>{r(d.target.value),a.onChange(d.target.value),c($(d.target.value,a.min,a.max))},style:{background:`linear-gradient(to right, #0a84ff 0%, #0a84ff ${n}%, #636366 ${n}%, #636366 100%)`}})}function $(a,l,r,n){var c=(a-l)*100/(r-l);return c>100?typeof n<"u"?(c=(n-a)*100/(n-r),c<0&&(c=0)):c=100:c<0&&(c=0),c}function ue(a){var h;const l=g(N.Settings),[r,n]=S.useState(!1),[c,d]=S.useState(null),o=g(R);return t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{r?n(!1):a.setPage([]),N.SoundManager.reset()},children:[e(L,{}),r?s("APPS.SETTINGS.BACK"):s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:r?c==="ringtone"?s("APPS.SETTINGS.RINGTONE"):s("APPS.SETTINGS.TEXT_TONE"):s("APPS.SETTINGS.SOUND_HAPTICS")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),r?t(I,{children:[e("div",{className:"category-title",children:c==="ringtone"?s("APPS.SETTINGS.RINGTONE"):s("APPS.SETTINGS.TEXT_TONE")}),e("section",{children:Object.keys((h=o.sounds)==null?void 0:h[c]).map((T,E)=>e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{var u,P;N.Settings.patch({sound:{...N.Settings.value.sound,[c]:T}}),N.SoundManager.set({url:`./assets/sound/ringtones/${(P=(u=o.sounds)==null?void 0:u[c])==null?void 0:P[T]}`,timeout:c==="ringtones"?5e3:null,overflow:!0})},children:t("div",{className:"setting",children:[T==l.sound[c]?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:w(T)})]})},E))})]}):t(I,{children:[e("div",{className:"category-title",children:s("APPS.SETTINGS.RINGTONE_VOLUME")}),e("section",{children:t("div",{className:"settings-item",children:[e(Z,{}),e(H,{onChange:T=>{N.Settings.patch({sound:{...N.Settings.value.sound,volume:T}})},value:l.sound.volume,min:0,max:1,step:.05}),e(j,{})]})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.SOUND_HAPTICS_PATTERNS")}),t("section",{children:[t("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{d("ringtone"),n(!0)},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.RINGTONE")})}),t("div",{className:"setting-value",children:[e("div",{className:"value",children:w(l.sound.ringtone)}),e(y,{className:"chevron"})]})]}),t("div",{className:"settings-item",style:{cursor:"pointer"},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.TEXT_TONE")})}),t("div",{className:"setting-value",children:[e("div",{className:"value",children:s("APPS.SETTINGS.DEFAULT")}),e(y,{className:"chevron"})]})]})]})]})]})}function Ee(a){const l=g(N.Settings),[r,n]=S.useState(!1);return t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{r?n(!1):a.setPage([])},children:[e(L,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.DISPLAY_BRIGHTNESS")}),e("div",{})]}),e("div",{style:{marginTop:"2rem"}}),e("div",{className:"category-title",children:s("APPS.SETTINGS.APPEARANCE")}),t("section",{children:[e("div",{className:"settings-item",children:e("div",{className:"appearance-container",children:e("div",{className:"appearance-switches",children:["light","dark"].map((c,d)=>t("div",{className:"mode",onClick:()=>{N.Settings.patch({display:{...l.display,theme:c}})},children:[e("img",{src:`./assets/img/${c}-mode-placeholder.png`,alt:"Theme"}),e("div",{className:"mode-text",children:w(c)}),e(he,{checked:l.display.theme===c})]},d))})})}),t("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.AUTOMATIC")})}),e("div",{className:"setting-value",children:e(U,{onChange:()=>{}})})]})]}),e("div",{className:"category-title",children:s("APPS.SETTINGS.BRIGHTNESS")}),e("section",{children:t("div",{className:"settings-item",children:[e(Q,{}),e(H,{onChange:c=>{N.Settings.patch({display:{...l.display,brightness:c}})},value:l.display.brightness,min:.1,max:1,step:.01}),e(J,{})]})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.PHONE_SCALE")}),e("section",{children:t("div",{className:"settings-item",children:[e(ee,{}),e(H,{onChange:c=>{N.Settings.patch({display:{...l.display,size:c}})},value:l.display.size,min:.5,max:1,step:.05}),e(X,{})]})})]})}function pe(a){const l=g(N.Settings),[r,n]=S.useState(!1),c=g(R);return t("div",{className:"animation-slide right",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{r?n(!1):a.setPage([])},children:[e(L,{}),r?s("APPS.SETTINGS.WALLPAPER"):s("APPS.SETTINGS.TITLE")]}),t("div",{className:"title",children:[r?s("APPS.SETTINGS.WALLPAPERS"):s("APPS.SETTINGS.WALLPAPER")," "]}),e("div",{})]}),r?t("div",{className:"wallpapers-container",children:[e("div",{className:"wallpaper add",alt:"Wallpaper",onClick:()=>{O.Gallery.set({onSelect:d=>{N.Settings.patch({wallpaper:{...l.wallpaper,background:d.src}})}})},children:e(X,{})}),l.wallpaper.background.includes("http")&&e("div",{className:"wallpaper active",alt:"Wallpaper",style:{backgroundImage:`url(${l.wallpaper.background})`}}),c.wallpapers.map((d,o)=>e(ve,{wallpaper:d,selected:l.wallpaper.background,theme:l.display.theme,cb:()=>{N.Settings.patch({wallpaper:{...l.wallpaper,background:d}})}},o))]}):e(ge,{settings:l,setExploringWallpapers:n})]})}const ve=({wallpaper:a,theme:l,selected:r,cb:n})=>{const[c,d]=S.useState("");return S.useEffect(()=>{Y(a,l,o=>d(o))},[]),e("div",{className:`wallpaper ${r===a?"active":""}`,alt:"Wallpaper",style:{backgroundImage:`url(${c})`},onClick:()=>n()})},ge=a=>{const[l,r]=S.useState("");let n=a.settings;return S.useEffect(()=>{Y(n.wallpaper.background,n.display.theme,c=>r(c))},[]),t("section",{children:[t("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{a.setExploringWallpapers(!0)},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.CHOOSE_NEW_WALLPAPER")})}),e("div",{className:"setting-value",children:e(y,{className:"chevron"})})]}),e("div",{className:"settings-item",children:t("div",{className:"wallpapers",children:[e("div",{className:"preview",style:{backgroundImage:`url(${l})`},alt:"Wallpaper",children:t("div",{className:"lockscreen-container",children:[e(se,{}),e("div",{className:"time",children:"13:37"}),e("div",{className:"date",children:"Friday, September 16"})]})}),e("div",{className:"preview",style:{backgroundImage:`url(${l})`},alt:"Wallpaper"})]})})]})};function Ae(a){var h,T,E,u;const l=g(N.Settings),[r,n]=S.useState(!1),[c,d]=S.useState(null),o=g(R);return t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{r?n(!1):a.setPage([])},children:[e(L,{}),r?s("APPS.SETTINGS.BACK"):s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:r?c:s("APPS.SETTINGS.NOTIFICATIONS")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),r?e(I,{children:t("section",{children:[t("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.ALLOW_NOTIFICATIONS")})}),e("div",{className:"setting-value",children:e(U,{onChange:()=>{var P,m,f;N.Settings.patch({notifications:{...l.notifications,[c]:{...(P=l.notifications)==null?void 0:P[c],enabled:!((f=(m=l.notifications)==null?void 0:m[c])!=null&&f.enabled)}}})},checked:((T=(h=l.notifications)==null?void 0:h[c])==null?void 0:T.enabled)??!0})})]}),t("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.SOUNDS")})}),e("div",{className:"setting-value",children:e(U,{onChange:()=>{var P,m,f;N.Settings.patch({notifications:{...l.notifications,[c]:{...(P=l.notifications)==null?void 0:P[c],sound:!((f=(m=l.notifications)==null?void 0:m[c])!=null&&f.sound)}}})},checked:((u=(E=l.notifications)==null?void 0:E[c])==null?void 0:u.sound)??!0})})]})]})}):t(I,{children:[e("div",{className:"category-title",children:s("APPS.SETTINGS.NOTIFICATIONS")}),e("section",{style:{paddingBottom:"4rem"},children:Object.keys(o.apps).filter(P=>{var m;return q(P,l.apps)||((m=o.apps[P])==null?void 0:m.removable)===!1}).map((P,m)=>t("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{d(P),n(!0)},children:[t("div",{className:"setting",children:[e("img",{src:o.apps[P].icon??`./assets/img/icons/apps/${P}.png`}),e("div",{className:"title",children:o.apps[P].name})]}),e("div",{className:"setting-value",children:e(y,{className:"chevron"})})]},m))})]})]})}function Ie(a){const{settingsSections:l}=S.useContext(K),r=g(N.Settings),n=g(R),c=8.25*1e3*1e3;return S.useEffect(()=>{if(!n.apps)return;let d=Object.keys(n.apps).filter(h=>{var T;return((T=n.apps[h])==null?void 0:T.removable)===!1}).reduce((h,T)=>h+n.apps[T].size,0),o=r.storage.used-(d+c);R.patch({apps:{...n.apps,Photos:{...n.apps.Photos,size:n.apps.Photos.size+o}}})},[]),t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{var d;a.setPage((d=l==null?void 0:l[2])==null?void 0:d[0].options)},children:[e(L,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.STORAGE")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),e("section",{children:t("div",{className:"settings-item",style:{cursor:"pointer"},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.USED")})}),e("div",{className:"setting-value",children:t("div",{className:"value",children:[B(r.storage.used/1e3/1e3,2)," GB ",s("APPS.SETTINGS.OF")," ",B(r.storage.total/1e3/1e3,0)," GB"]})})]})}),e("section",{children:Object.keys(n.apps).filter(d=>{var o;return q(d,r.apps)||((o=n.apps[d])==null?void 0:o.removable)===!1}).sort((d,o)=>n.apps[o].size-n.apps[d].size).map((d,o)=>t("div",{className:"settings-item",style:{cursor:"pointer"},children:[t("div",{className:"setting",children:[e("img",{src:`./assets/img/icons/apps/${d}.png`}),e("div",{className:"title",children:n.apps[d].name})]}),e("div",{className:"setting-value",children:e("div",{className:"value",children:n.apps[d].size>1e6?B(n.apps[d].size/1e6,2)+" GB":n.apps[d].size>1e3?B(n.apps[d].size/1e3,2)+" MB":n.apps[d].size+" KB"})})]}))})]})}function Ce(a){const l=S.useRef(null),r=g(N.Settings),[n,c]=S.useState([]),[d,o]=S.useState(!1),[h,T]=S.useState([]),[E,u]=S.useState(!1),P=p=>{if(p=="backspace")c(C=>C.slice(0,-1));else{const C=[...n,p];c([...n,p]),C.length>3&&(E?A("Security",{action:"setPin",pin:C.join("")}).then(v=>{N.Settings.patch({security:{...r.security,pinCode:!0}}),u(!1),c([])}):A("Security",{action:"verifyPin",pin:C.join("")}).then(v=>{v?(o(!0),T(C),c([])):(l.current.className=`pin-circles wrong ${r.display.theme=="dark"?"light":"dark"}`,setTimeout(()=>{l.current.className=`pin-circles ${r.display.theme=="dark"?"light":"dark"}`,c([])},350))}))}},m=p=>{p?A("Security",{action:"setFaceId",pin:h.join("")}).then(C=>{C&&N.Settings.patch({security:{...N.Settings.value.security,faceId:!0}})}):A("Security",{action:"removeFaceId",pin:h.join("")}).then(C=>{C&&N.Settings.patch({security:{...N.Settings.value.security,faceId:!1}})})},f=()=>{A("Security",{action:"removePin",pin:n.join("")}).then(p=>{p&&N.Settings.patch({security:{pinCode:!1,faceId:!1}})})};return t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{a.setPage([])},children:[e("i",{className:"fal fa-chevron-left"}),d||!r.security.pinCode?s("APPS.SETTINGS.BACK"):s("CANCEL")]}),e("div",{className:"title",children:d||!r.security.pinCode?s("APPS.SETTINGS.FACE_ID_PASSWORD"):s("APPS.SETTINGS.ENTER_PASSCODE")}),e("div",{})]}),d||!r.security.pinCode?e(I,{children:E?t("div",{className:"passcode-container",children:[t("div",{className:"pin",children:[s("APPS.SETTINGS.ENTER_PASSCODE"),e(W,{pin:n,dark:r.display.theme,Ref:l})]}),e("div",{className:"numbers",children:e(x,{cb:p=>{P(p)}})})]}):t(I,{children:[e("div",{style:{marginTop:"0.5rem"}}),e("div",{className:"category-title",children:s("APPS.SETTINGS.FACE_ID")}),e("section",{children:r.security.faceId?e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.TITLE"),description:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.CANCEL")},{title:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.CONFIRM"),color:"red",cb:()=>{m(!1)}}]})},children:e("div",{className:"setting",children:e("div",{className:"title red",children:s("APPS.SETTINGS.RESET_FACE_ID")})})}):e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{r.security.pinCode&&O.PopUp.set({title:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.TITLE"),description:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.CANCEL")},{title:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.CONFIRM"),cb:()=>{m(!0)}}]})},children:e("div",{className:"setting",children:e("div",{className:`title ${r.security.pinCode?"blue":"grey"}`,children:s("APPS.SETTINGS.ENABLE_FACE_ID")})})})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.PIN_CODE")}),e("section",{children:r.security.pinCode?t(I,{children:[e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.DISABLE_PIN_POPUP.TITLE"),description:s("APPS.SETTINGS.DISABLE_PIN_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.DISABLE_PIN_POPUP.CANCEL")},{title:s("APPS.SETTINGS.DISABLE_PIN_POPUP.CONFIRM"),color:"red",cb:()=>f()}]})},children:e("div",{className:"setting",children:e("div",{className:"title blue",children:s("APPS.SETTINGS.TURN_PASSCODE_OFF")})})}),e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>u(!0),children:e("div",{className:"setting",children:e("div",{className:"title blue",children:s("APPS.SETTINGS.CHANGE_PASSCODE")})})})]}):t(I,{children:[e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{u(!0)},children:e("div",{className:"setting",children:e("div",{className:"title blue",children:s("APPS.SETTINGS.TURN_PASSCODE_ON")})})}),e("div",{className:"settings-item",children:e("div",{className:"setting",children:e("div",{className:"title grey",children:s("APPS.SETTINGS.CHANGE_PASSCODE")})})})]})})]})}):t("div",{className:"passcode-container",children:[t("div",{className:"pin",children:[s("APPS.SETTINGS.ENTER_PASSCODE"),e(W,{pin:n,dark:r.display.theme,Ref:l})]}),e("div",{className:"numbers",children:e(x,{cb:p=>P(p)})})]})]})}function fe(a){var u;const l=g(N.Settings),r=g(N.PhoneNumber),[n,c]=S.useState(!1),[d,o]=S.useState(!1),[h,T]=S.useState([]);S.useEffect(()=>{A("Phone",{action:"getBlockedNumbers"}).then(P=>{P&&T(P)})},[]);const E=P=>{A("Phone",{action:"toggleBlock",number:P,blocked:!1}).then(m=>{m&&T(f=>f.filter(p=>p!==P))})};return t("div",{className:`animation-slide ${n?"left":"right"}`,children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>n?c(!1):a.setPage([]),children:[e(L,{}),n?s("APPS.SETTINGS.BACK"):s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:n?s("APPS.SETTINGS.BLOCKED_CONTACTS"):s("APPS.SETTINGS.PHONE")}),n?e("div",{className:"value",onClick:()=>o(P=>!P),children:d?s("APPS.SETTINGS.DONE"):s("APPS.SETTINGS.EDIT")}):e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),n?e(I,{children:e("section",{children:h.map((P,m)=>t("div",{className:"settings-item",children:[t("div",{className:"setting",children:[d?e(F,{className:"remove",onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.UNBLOCK_POPUP.TITLE"),description:s("APPS.SETTINGS.UNBLOCK_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.UNBLOCK_POPUP.CANCEL")},{title:s("APPS.SETTINGS.UNBLOCK_POPUP.CONFIRM"),color:"red",cb:()=>{E(P)}}]})}}):e(F,{className:"hidden"}),e("div",{className:"title",children:M(P)})]}),e("div",{className:"setting-value"})]},m))})}):t(I,{children:[e("section",{children:t("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.MY_NUMBER")})}),t("div",{className:"setting-value",children:[M(r),e(te,{onClick:()=>{ae(r)}})]})]})}),t("section",{children:[t("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.SHOW_CALLER_ID")})}),e("div",{className:"setting-value",children:e(U,{onChange:()=>{var P;N.Settings.patch({phone:{...l.phone,showCallerId:!((P=l.phone)!=null&&P.showCallerId)}})},checked:((u=l.phone)==null?void 0:u.showCallerId)??!1})})]}),t("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>c(!0),children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.BLOCKED_CONTACTS")})}),e("div",{className:"setting-value",children:e(y,{className:"chevron"})})]})]})]})]})}function V({setPage:a,type:l}){const{settingsSections:r}=S.useContext(K);return t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{var n;return a((n=r==null?void 0:r[2])==null?void 0:n[0].options)},children:[e(L,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s(`APPS.SETTINGS.${l.toUpperCase()}`)}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),t("section",{children:[l==="Language"&&e(Ge,{}),l==="Temperature"&&e(ke,{})]})]})}const Ge=()=>{const a=g(N.Settings),[l,r]=S.useState([]);return S.useEffect(()=>{A("getLocales").then(n=>{n&&r(n)})},[]),S.useEffect(()=>{ie(a.locale)},[a.locale]),l.map((n,c)=>e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>N.Settings.patch({locale:n.locale}),children:t("div",{className:"setting",children:[n.locale===a.locale?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:n.name})]})},c))},ke=()=>{const a=g(N.Settings);return t(I,{children:[e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>N.Settings.patch({weather:{celcius:!0}}),children:t("div",{className:"setting",children:[a.weather&&a.weather.celcius?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:s("APPS.SETTINGS.CELCIUS")})]})}),e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>N.Settings.patch({weather:{celcius:!1}}),children:t("div",{className:"setting",children:[a.weather&&a.weather.celcius===!1?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:s("APPS.SETTINGS.FAHRENHEIT")})]})})]})};function Oe({setPage:a}){const l=g(N.PhoneNumber),[r,n]=S.useState([]),[c,d]=S.useState(!1);return S.useEffect(()=>{A("Backup",{action:"get"}).then(o=>{o&&n(o)})},[]),t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>a([]),children:[e(L,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.CLOUD_BACKUP")}),e("div",{className:"value",onClick:()=>d(o=>!o),children:c?s("APPS.SETTINGS.DONE"):s("APPS.SETTINGS.EDIT")})]}),e("div",{style:{marginTop:"0.5rem"}}),e("div",{className:"category-title",children:s("APPS.SETTINGS.YOUR_PROFILE")}),e("section",{children:t("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{r.find(o=>o.number===l)||O.PopUp.set({title:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.TITLE"),description:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.CANCEL")},{title:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.CONFIRM"),cb:()=>{A("Backup",{action:"create"}).then(o=>{o&&n([{number:l},...r])})}}]})},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.CREATE_BACKUP")})}),e("div",{className:"setting-value"})]})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.BACKUPS")}),e("section",{children:r.map((o,h)=>t("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.TITLE"),description:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.CANCEL")},{title:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.CONFIRM"),color:"red",cb:()=>{A("Backup",{action:"apply",number:o.number}).then(T=>{T&&setTimeout(()=>{O.PopUp.set({title:s("APPS.SETTINGS.SUCCESS"),description:s("APPS.SETTINGS.SUCCESS_TEXT"),buttons:[{title:s("APPS.SETTINGS.OK")}]})},500)})}}]})},children:[t("div",{className:"setting",children:[c&&e(F,{className:"remove",onClick:T=>{T.stopPropagation(),O.PopUp.set({title:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.TITLE"),description:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.CANCEL")},{title:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.CONFIRM"),color:"red",cb:()=>{A("Backup",{action:"delete",number:o.number}).then(E=>{E&&n(u=>u.filter(P=>P.number!==o.number))})}}]})}}),e("div",{className:"title",children:M(o.number)})]}),e("div",{className:"setting-value"})]},h))})]})}const K=S.createContext(null);function Be(){var C;const a=g(N.Settings),[l,r]=S.useState(""),[n,c]=S.useState([]),[d,o]=S.useState([]),[h,T]=S.useState(null),[E,u]=S.useState([]),[P,m]=S.useState([]);S.useEffect(()=>{m(v=>{let G=0;return[[{name:s("APPS.SETTINGS.AIRPLANE_MODE"),icon:e(ne,{className:"orange"}),switch:!0,value:a.airplaneMode,onChange:()=>{N.Settings.patch({airplaneMode:!a.airplaneMode})}},{name:s("APPS.SETTINGS.STREAMER_MODE"),icon:e(le,{className:"purple"}),switch:!0,value:a.streamerMode,onChange:()=>{N.Settings.patch({streamerMode:!a.streamerMode})}},{name:s("APPS.SETTINGS.BLUETOOTH"),icon:e(ce,{className:"blue"}),value:s("APPS.SETTINGS.ON")}],[{name:s("APPS.SETTINGS.NOTIFICATIONS"),icon:e(re,{className:"red"}),options:e(Ae,{setPage:o})},{name:s("APPS.SETTINGS.SOUND_HAPTICS"),icon:e(j,{className:"pink"}),options:e(ue,{setPage:o})}],[{name:s("APPS.SETTINGS.GENERAL"),icon:e(oe,{className:"grey"}),options:[[{name:s("APPS.SETTINGS.ABOUT"),options:[[{name:s("APPS.SETTINGS.NAME"),value:a.name,input:{type:"name",maxLength:20},cb:(i,_)=>{A("setPhoneName",i)}},{name:s("APPS.SETTINGS.VERSION"),value:"15.0"},{name:s("APPS.SETTINGS.MODEL_NAME"),value:"Phone 13 Pro"},{name:s("APPS.SETTINGS.SERIAL_NUMBER"),value:"DSDWWWSSF3"},{name:s("APPS.SETTINGS.DEVELOPED_BY"),value:"Breze & Loaf Scripts"},{name:s("APPS.SETTINGS.PURCHASE_AT"),value:"https://lbphone.com"}],[{name:s("APPS.SETTINGS.SONGS"),value:"0"},{name:s("APPS.SETTINGS.VIDEOS"),value:"0"},{name:s("APPS.SETTINGS.PHOTOS"),value:G??0},{name:s("APPS.SETTINGS.APPLICATIONS"),value:f()},{name:s("APPS.SETTINGS.CAPACITY"),value:`${a.storage.total/1e3/1e3} GB`},{name:s("APPS.SETTINGS.AVAILABLE"),value:`${B((a.storage.total-a.storage.used)/1e3/1e3,1)} GB`}]]},{name:s("APPS.SETTINGS.SOFTWARE_UPDATE"),options:[[{name:s("APPS.SETTINGS.AUTOMATIC_UPDATES"),value:s("APPS.SETTINGS.ON")}]]},{name:s("APPS.SETTINGS.PHONE_STORAGE"),options:e(Ie,{setPage:o})}],[{name:s("APPS.SETTINGS.DATE_TIME"),options:[[{name:s("APPS.SETTINGS.24_HOUR_TIME"),switch:!0,value:!a.time.twelveHourClock,id:"twelveHourClock",onChange:()=>{N.Settings.patch({time:{...a.time,twelveHourClock:!a.time.twelveHourClock}})}}],[{name:s("APPS.SETTINGS.SET_AUTOMATICALLY"),switch:!0,value:!0,disabled:!0},{name:s("APPS.SETTINGS.TIME_ZONE"),value:Intl.DateTimeFormat().resolvedOptions().timeZone??"Unknown"}]]},{name:s("APPS.SETTINGS.LANGUAGE_REGION"),options:[[{name:s("APPS.SETTINGS.LANGUAGE"),value:s("LABEL"),options:e(V,{type:"Language",setPage:o})}],[{name:s("APPS.SETTINGS.TEMPERATURE"),value:a.weather&&a.weather.celcius?"C":"F",options:e(V,{type:"Temperature",setPage:o})}]]}],[{name:s("APPS.SETTINGS.RESET_POPUP.TITLE"),onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.RESET_POPUP.TITLE"),description:s("APPS.SETTINGS.RESET_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.RESET_POPUP.CANCEL")},{title:s("APPS.SETTINGS.RESET_POPUP.CONFIRM"),color:"red",cb:()=>{A("Security",{action:"factoryReset"})}}]})}}]]},{name:s("APPS.SETTINGS.DISPLAY_BRIGHTNESS"),icon:e(de,{className:"blue"}),options:e(Ee,{setPage:o})},{name:s("APPS.SETTINGS.WALLPAPER"),icon:e(Se,{className:"lightblue"}),options:e(pe,{setPage:o})},{name:s("APPS.SETTINGS.FACE_ID_PASSWORD"),icon:e(Pe,{className:"green"}),options:e(Ce,{setPage:o})},{name:s("APPS.SETTINGS.BATTERY"),icon:e(Ne,{className:"green"})}],[{name:s("APPS.SETTINGS.PHONE"),icon:"./assets/img/icons/apps/Phone.png",color:"green",options:e(fe,{setPage:o}),last:!0}]]})},[a]);const f=()=>{let v=0;return a.apps.forEach(G=>{G.forEach(i=>{v++})}),v},p=S.useRef(!0);return S.useEffect(()=>{if(p.current){p.current=!1;return}A("setSettings",a)},[a]),S.useEffect(()=>{if(l.length>0){let v=P.map(G=>G.filter(i=>{var _;return i.name.toLowerCase().includes(l.toLowerCase())?!0:i.options&&((_=i.options)!=null&&_.name)?i.options.filter(k=>{if(k.name.toLowerCase().includes(l.toLowerCase()))return!0;if(k.options)return k.options.filter(D=>{if(D.name.toLowerCase().includes(l.toLowerCase()))return!0})}):!1}));c(v)}else c([])},[l]),e(K.Provider,{value:{settingsSections:P},children:e("div",{className:"settings-container",children:d.length===0?t("div",{className:"animation-slide right",children:[e("div",{className:"title",style:((C=a==null?void 0:a.display)==null?void 0:C.theme)==="dark"?{color:"#ffffff"}:{color:"#000000"},children:s("APPS.SETTINGS.TITLE")}),e(Te,{placeholder:s("SEARCH"),onChange:v=>r(v.target.value)}),n.length>0?e("section",{children:n.map((v,G)=>v.map((i,_)=>t("div",{className:"settings-item","data-clickable":!!(i.options||i.onClick),onClick:()=>{if(i.onClick)return i.onClick();i.options&&(o(i.options),T(i.name))},children:[t("div",{className:"setting",children:[i.icon&&(typeof i.icon=="string"?e("img",{src:i.icon}):i.icon),e("div",{className:"title",children:i.name})]}),t("div",{className:"setting-value",children:[i.switch&&e(U,{onChange:i.onChange,checked:i.value,disabled:i.disabled??!1}),i.value&&!i.switch&&e("div",{className:"value",children:i.value}),i.options&&e(y,{className:"chevron"})]})]},_)))}):t(I,{children:[t("div",{className:"profile",onClick:()=>o(e(Oe,{setPage:o})),children:[a!=null&&a.avatar?e("img",{src:a.avatar}):e("div",{className:"profile-image",children:me(a.name)}),t("div",{className:"profile-info",children:[e("div",{className:"name",children:a.name}),e("div",{className:"info",children:s("APPS.SETTINGS.CLOUD_BACKUP")})]}),e(y,{className:"chevron"})]}),P.map((v,G)=>e("section",{"data-last":G===P.length-1,children:v.map((i,_)=>t("div",{className:"settings-item","data-clickable":!!(i.options||i.onClick),onClick:()=>{if(i.onClick)return i.onClick();i.options&&(o(i.options),T(i.name))},children:[t("div",{className:"setting",children:[i.icon&&(typeof i.icon=="string"?e("img",{src:i.icon}):i.icon),e("div",{className:"title",children:i.name})]}),t("div",{className:"setting-value",children:[i.switch&&e(U,{onChange:i.onChange,checked:i.value,disabled:i.disabled??!1}),i.value&&!i.switch&&e("div",{className:"value",children:i.value}),i.options&&e(y,{className:"chevron"})]})]},_))},G))]})]}):e(I,{children:d.length?t("div",{className:"animation-slide left",children:[t("div",{className:"top",children:[t("div",{className:"back",onClick:()=>{o(E??[]),T((E==null?void 0:E.name)??"Settings"),u(null)},children:[e(L,{}),s("APPS.SETTINGS.TITLE")]}),t("div",{className:"title",children:[h??"Settings"," "]}),e("div",{})]}),d.map((v,G)=>e("section",{children:v.map((i,_)=>t("div",{className:"settings-item","data-clickable":!!(i.options||i.onClick),onClick:()=>{var k;if(i.onClick)return i.onClick();i.options&&(o(i.options),T(i.name),(k=i.options)!=null&&k[0]&&u(d))},children:[e("div",{className:"setting",children:e("div",{className:"title",children:i.name})}),e("div",{className:"setting-value",children:i.input?e(z,{defaultValue:i.value,maxLength:i.input.maxLength,onChange:k=>{let D={...a,[a[i.input.type]]:k.target.value};N.Settings.set(D)},onBlur:()=>{i.cb&&i.cb(a[i.input.type],a)}}):t(I,{children:[i.switch&&e(U,{onChange:()=>{var k;i.id?i.id=="twelveHourClock"&&N.Settings.patch({time:{...a==null?void 0:a.time,twelveHourClock:!((k=a==null?void 0:a.time)!=null&&k.twelveHourClock)}}):i.onChange()},checked:i.value,disabled:i.disabled??!1}),i.value&&e("div",{className:"value",children:i.value}),i.options&&e(y,{className:"chevron"})]})})]},_))},G))]}):d})})})}export{K as AppContext,Be as default};
