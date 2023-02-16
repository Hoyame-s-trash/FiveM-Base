import{r as C,a as i,j as e,F as g}from"./jsx-runtime-bb820e81.js";import{u as L,f as E,aI as T,L as c,ah as b,I as M,C as R,M as K,b as N,o as I,aJ as D,aK as $,ao as y,N as w,aL as H,aM as W,aN as V,aO as j}from"./Phone-a7ab6193.js";import{S as O}from"./Switch-81fd1e85.js";function U(){const t=L(N.Settings),[u,n]=C.useState({hour:0,minute:0}),[a,h]=C.useState(!1),r=L(T.Alarms),[m,S]=C.useState(null),v=o=>{let d=o.hour,l=o.minute;return t.time.twelveHourClock&&(d>12?d=d-12:d===0&&(d=12)),d<10&&(d=`0${d}`),l<10&&(l=`0${l}`),t.time.twelveHourClock?`${d}:${l} ${o.hour>12?"PM":"AM"}`:`${d}:${l}`};return i("div",{className:"alarm-container",children:[m&&e(Z,{cancel:()=>S(null),preTimer:{setPreTimer:n,preTimer:u},addAlarm:o=>{E("Clock",{action:"createAlarm",label:o.label,minutes:o.minutes,hours:o.hours}).then(d=>{d&&(T.Alarms.set([...r,{...o,id:d.id}]),S(null),n({hour:0,minute:0}))})}}),i("div",{className:"alarm-header",children:[i("div",{className:"alarm-header-top",children:[e("div",{className:"edit",onClick:()=>h(!a),children:a?c("APPS.CLOCK.ALARM.DONE"):c("APPS.CLOCK.ALARM.EDIT")}),e(b,{onClick:()=>{S(!0)}})]}),e("div",{className:"alarm-title",children:c("APPS.CLOCK.ALARM.TITLE")})]}),e("div",{className:"alarm-content",children:r.map((o,d)=>{let l=o.enabled?a?"":" active":"";return e("div",{className:`alarm${l}`,children:a?i(g,{children:[i("div",{className:"alarm-wrapper",children:[e(M,{onClick:()=>{R.PopUp.set({title:c("APPS.CLOCK.ALARM.DELETE_TITLE"),description:c("APPS.CLOCK.ALARM.DELETE_TEXT"),buttons:[{title:c("APPS.CLOCK.ALARM.BUTTON_CANCEL")},{title:c("APPS.CLOCK.ALARM.BUTTON_DELETE"),color:"red",cb:()=>{T.Alarms.set(r.filter(s=>s.id!==o.id))}}]})}}),i("div",{className:"alarm-info",children:[e("div",{className:"time",children:v({hour:o.hours,minute:o.minutes})}),e("div",{className:"label",children:o.label??c("APPS.CLOCK.ALARM.TITLE")})]})]}),e(K,{})]}):i(g,{children:[i("div",{className:"alarm-info",children:[e("div",{className:"time",children:v({hour:o.hours,minute:o.minutes})}),e("div",{className:"label",children:o.label??c("APPS.CLOCK.ALARM.TITLE")})]}),e(O,{onChange:()=>{T.Alarms.set(r.map((s,A)=>(A===d&&(s.enabled=!s.enabled),s)))},checked:o.enabled,theme:"dark"})]})},d)})})]})}function Z(t){const[u,n]=C.useState("");let a=t.preTimer;const h=()=>{t.addAlarm({hours:a.preTimer.hour,minutes:a.preTimer.minute,label:u&&u.length>0?u:null,enabled:!0})};return i("div",{className:"new-alarm",children:[i("div",{className:"new-alarm-header",children:[e("div",{className:"cancel",onClick:()=>{t.cancel()},children:c("APPS.CLOCK.ALARM.CANCEL")}),e("div",{className:"title",children:c("APPS.CLOCK.ALARM.ADD")}),e("div",{className:"save",onClick:()=>h(),children:c("APPS.CLOCK.ALARM.SAVE")})]}),i("div",{className:"new-alarm-content",children:[i("div",{className:"picker darker",children:[e("div",{children:i("ul",{onScroll:r=>{let m=Math.floor(r.target.scrollTop/(r.target.scrollHeight/28));a.setPreTimer({...a.preTimer,hour:m})},children:[e("li",{}),e("li",{}),[...Array(24).keys()].map((r,m)=>e("li",{onClick:S=>P(S.target),children:r<10?`0${r}`:r},m)),e("li",{}),e("li",{})]})}),e("div",{children:i("ul",{onScroll:r=>{let m=Math.floor(r.target.scrollTop/(r.target.scrollHeight/64));a.setPreTimer({...a.preTimer,minute:m})},children:[e("li",{}),e("li",{}),[...Array(60).keys()].map((r,m)=>e("li",{onClick:S=>P(S.target),children:r<10?`0${r}`:r},m)),e("li",{}),e("li",{})]})}),e("div",{className:"selected"})]}),i("div",{className:"settings",children:[i("div",{className:"item",children:[e("div",{className:"label",children:c("APPS.CLOCK.ALARM.LABEL")}),e(I,{type:"text",placeholder:c("APPS.CLOCK.ALARM.TITLE"),onChange:r=>{n(r.target.value)}})]}),i("div",{className:"item",children:[e("div",{className:"label",children:c("APPS.CLOCK.ALARM.SOUND")}),e(O,{disabled:!0,checked:!0})]}),i("div",{className:"item",children:[e("div",{className:"label",children:c("APPS.CLOCK.ALARM.SNOOZE")}),e(O,{disabled:!0,checked:!1})]})]})]})]})}function f(t){let u=t.disabled?" disabled":"",n=t.active?" active":"";return e("div",{className:`button${n}${u}`,children:e("div",{className:"button-inner",onClick:()=>{t.onClick()},children:t.content})})}function _(){const t=L(T.Stopwatch);return i("div",{className:"stopwatch-container",children:[e("div",{className:"clock",children:p(t.time,!0)}),i("div",{className:"actions",children:[e(f,{content:t.running||!t.running&&t.time==0?c("APPS.CLOCK.STOPWATCH.LAP"):c("APPS.CLOCK.STOPWATCH.RESET"),onClick:()=>{!t.running&&t.time!==0?T.Stopwatch.set({running:!1,time:0,laps:[]}):t.time>0&&T.Stopwatch.set({...t,laps:[...t.laps,t.time]})},disabled:!t.running&&t.time===0}),e(f,{active:t.running,onClick:()=>T.Stopwatch.set({...t,running:!t.running}),content:t.running?c("APPS.CLOCK.STOPWATCH.STOP"):c("APPS.CLOCK.STOPWATCH.START")})]}),e("div",{className:"laps",children:t.laps.map((u,n)=>i("div",{className:"lap",children:[i("div",{className:"label",children:[c("APPS.CLOCK.STOPWATCH.LAP")," ",n+1]}),e("div",{className:"time",children:p(n===0?u:u-t.laps[n-1],!0)})]},n))})]})}function F(){const t=L(w),u=L(N.Settings),n=L(T.Timer),[a,h]=C.useState({hours:0,minutes:0,seconds:0}),r=C.useRef(null),m=C.useRef(null),S=C.useRef(null),[v,o]=C.useState(null);C.useEffect(()=>{let l=new Date(Date.now()+n.time*1e3);o(l.toLocaleTimeString(t.DateLocale,{hour:"numeric",minute:"numeric",hour12:u.time.twelveHourClock}))},[]);const d=()=>{let l=a.hours*3600+a.minutes*60+a.seconds;if(l>0){T.Timer.set({running:!0,time:l});let s=new Date(Date.now()+l*1e3);o(s.toLocaleTimeString(t.DateLocale,{hour:"numeric",minute:"numeric",hourCycle:"h23"}))}};return C.useEffect(()=>{if(!n.running){T.Timer.set({running:!1,time:0});let l=r.current.querySelector(".active"),s=m.current.querySelector(".active"),A=S.current.querySelector(".active");l&&l.scrollIntoView({block:"center"}),s&&s.scrollIntoView({block:"center"}),A&&A.scrollIntoView({block:"center"})}},[n.running]),i("div",{className:"timer-container",children:[n.running?i(g,{children:[i("div",{className:"timer-wrapper",children:[e("div",{className:"border-wrapper",children:e(D,{value:n.time/(a.hours*3600+a.minutes*60+a.seconds)*100,strokeWidth:2,styles:$({strokeLinecap:"butt",pathColor:"#ff9f0a",trailColor:"#2d2d2d",pathTransitionDuration:.5})})}),i("div",{className:"timer",children:[e("div",{className:"timer-text",children:p(n.time,!1)}),v&&i("div",{className:"when-done",children:[e(y,{}),v]})]})]}),e("div",{className:"margin"})]}):i("div",{className:"picker",children:[i("div",{ref:r,children:[i("ul",{onScroll:l=>{let s=Math.floor(l.target.scrollTop/(l.target.scrollHeight/29));h({...a,hours:s})},children:[e("li",{}),e("li",{}),[...Array(24).keys()].map((l,s)=>e("li",{onClick:A=>P(A.target),className:a.hours===l?"active":"",children:e("span",{children:l})},s)),e("li",{}),e("li",{})]}),e("div",{className:"label",children:c("APPS.CLOCK.TIMER.HOURS")})]}),i("div",{ref:m,children:[i("ul",{onScroll:l=>{let s=Math.floor(l.target.scrollTop/(l.target.scrollHeight/65));h({...a,minutes:s})},children:[e("li",{}),e("li",{}),[...Array(60).keys()].map((l,s)=>e("li",{onClick:A=>P(A.target),className:a.minutes===l?"active":"",children:l},s)),e("li",{}),e("li",{})]}),e("div",{className:"label",children:c("APPS.CLOCK.TIMER.MINUTES")})]}),i("div",{ref:S,children:[i("ul",{onScroll:l=>{let s=Math.floor(l.target.scrollTop/(l.target.scrollHeight/65));h({...a,seconds:s})},children:[e("li",{}),e("li",{}),[...Array(60).keys()].map((l,s)=>e("li",{onClick:A=>P(A.target),className:a.seconds===l?"active":"",children:l},s)),e("li",{}),e("li",{})]}),e("div",{className:"label",children:c("APPS.CLOCK.TIMER.SECONDS")})]}),e("div",{className:"selected"})]}),i("div",{className:"actions",children:[e(f,{content:c("APPS.CLOCK.TIMER.CANCEL"),onClick:()=>{n.running&&T.Timer.set({running:!1,time:0})},disabled:!n.running}),e(f,{content:n.running?c("APPS.CLOCK.TIMER.STOP"):c("APPS.CLOCK.TIMER.START"),onClick:()=>{n.running?T.Timer.set({...n,running:!1}):d()},active:!1})]})]})}function B(){const t=L(w),u=L(N.Settings),n=t.world_clock_locations,a=r=>new Date().toLocaleTimeString(t.DateLocale,{timeZone:n[r],hour:"2-digit",minute:"2-digit",hour12:u.time.twelveHourClock}),h=r=>{const m=new Date;let S=m.toLocaleTimeString([],{hour:"2-digit",hour12:!1}),v=m.toLocaleDateString([],{day:"numeric"}),o=m.toLocaleTimeString([],{hour:"2-digit",hour12:!1,timeZone:n[r]}),d=m.toLocaleDateString([],{day:"numeric",timeZone:n[r]}),l=o-S;return d>v?`${c("APPS.CLOCK.WORLDCLOCK.TOMORROW")} ${l>0?"+":""}${l}HRS`:d<v?`${c("APPS.CLOCK.WORLDCLOCK.YESTERDAY")} ${l>0?"+":""}${l}HRS`:`${c("APPS.CLOCK.WORLDCLOCK.TODAY")} ${l>0?"+":""}${l}HRS`};return i("div",{className:"worldclock-container",children:[e("div",{className:"worldclock-header",children:e("div",{className:"worldclock-title",children:c("APPS.CLOCK.WORLDCLOCK.TITLE")})}),e("div",{className:"worldclock-content",children:Object.keys(n).map((r,m)=>i("div",{className:"worldclock",children:[i("div",{className:"worldclock-location",children:[e("div",{className:"difference",children:h(r)}),e("div",{className:"location",children:r})]}),e("div",{className:"time",children:a(r)})]},m))})]})}function G(){var d;const t=L(N.App),[u,n]=C.useState(((d=t==null?void 0:t.data)==null?void 0:d.view)??"Timer");let a={"World Clock":c("APPS.CLOCK.WORLDCLOCK.TITLE"),Alarm:c("APPS.CLOCK.ALARM.TITLE"),Stopwatch:c("APPS.CLOCK.STOPWATCH.TITLE"),Timer:c("APPS.CLOCK.TIMER.TITLE")};const h=[e(B,{}),e(U,{}),e(_,{}),e(F,{})],r=[e(H,{}),e(W,{}),e(V,{}),e(j,{})],[m,S]=C.useState([]),[v,o]=C.useState([]);return C.useEffect(()=>{let l=[],s=[];Object.keys(a).forEach((A,k)=>{l[a[A]]=h[k],s[a[A]]=r[k]}),S(l),o(s)},[]),i("div",{className:"clock-container",children:[e("div",{className:"clock-body",children:m[u]}),e("div",{className:"clock-footer",children:Object.keys(v).map((l,s)=>i("div",{className:`${u==l?"active":""}`,onClick:()=>n(l),children:[v[l],l]},s))})]})}const p=(t,u)=>{if(u){let n=t%100,a=Math.floor(t/100)%60,h=Math.floor(t/6e3)%60,r=Math.floor(t/36e4)%24;return r>0?`${r.toString().padStart(2,"0")}:${h.toString().padStart(2,"0")}:${a.toString().padStart(2,"0")}.${n.toString().padStart(2,"0")}`:`${h.toString().padStart(2,"0")}:${a.toString().padStart(2,"0")}.${n.toString().padStart(2,"0")}`}else{let n=t%60,a=Math.floor(t/60)%60;return`${(Math.floor(t/3600)%24).toString().padStart(2,"0")}:${a.toString().padStart(2,"0")}:${n.toString().padStart(2,"0")}`}},P=(t,u)=>{t&&t.scrollIntoView({behavior:"smooth",block:"center"})};export{G as default,p as formatTime,P as snapElement};
