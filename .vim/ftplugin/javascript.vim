"if you want to use jshint
setlocal makeprg=./buildout/node_modules/jshint/bin/jshint\ %

"node-jshint
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
"pure jshint
"setlocal errorformat=%-P[jshint]\ Error(s)\ in\ %f:,%E%m.\ (line:\ %l\\,\ character:\ %c),%C%s%>,%Z


"if you want to use jslint
"setlocal makeprg=jslint\ %
"setlocal errorformat=%-P%f,
"                    \%E%>\ #%n\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
"                    \%-G%f\ is\ OK.,%-Q



" deprecated:                    
"setlocal errorformat=%-P%f,
"                    \%-G/*jslint\ %.%#*/,
"                    \%*[\ ]%n\ %l\\,%c:\ %m,
"                    \%-G\ \ \ \ %.%#,
"                    \%-GNo\ errors\ found.,
"                    \%-Q
