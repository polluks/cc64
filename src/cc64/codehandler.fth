\ *** Block No. 72, Hexblock 48

\ codehandler: loadscreen      20sep94pz

\prof profiler-bucket [codehandler]

\ terminology / interface:

\ fuer programmcode:
\ b!  w!  b,  w,  pc  *=  flushcode

\ fuer statische variable:
\ cstat,  stat,  >staticadr  staticadr>
\ flushstatic

\ fuer dynamische variable:
\ dyn-offs  dyn-reset  dyn-allot

\ fuer codelayout:
\ lib.first          codelayout.ok
\ code.first         end-of-code
\ code.last
\ statics.first
\ statics.libfirst
\ statics.last


\ *** Block No. 73, Hexblock 49

\   codehandler: dynamics,init 19apr94pz

|| variable >tos-offs

~ : dyn-offs  ( -- offs )  >tos-offs @ ;

~ : dyn-reset  ( -- )  >tos-offs off ;

~ : dyn-allot ( n -- offs )
     dyn-offs  swap >tos-offs +! ;


~ doer flushcode ( -- )

|| doer flushstatic ( -- )


|| variable nolayout

|| : init-codehandler  nolayout on ;

   init: init-codehandler


\ *** Block No. 74, Hexblock 4a

\   codehandler: code          19apr94pz

|| variable >pc
~ : pc  >pc @ ;

|| variable codeoffset
|| : clearcode ( -- )
     pc code[ - codeoffset ! ;
~ : *=   >pc !  clearcode ;

|| : >codeadr ( pc-adr -- code-buf-adr )
    nolayout @  *nolayout* ?fatal
    (CX enable-code[]-bank C)
    codeoffset @ - dup
    code[ ]code 1- uwithin
    0= *functoolong* ?fatal ;

~ : b! ( 8b pc-adr -- )  >codeadr c! ;
~ : w! ( 16b pc-adr -- )  >codeadr ! ;

~ : b,  ( 8b -- )     pc b! 1 >pc +! ;
~ : w,  ( 16b -- )    pc w! 2 >pc +! ;


\ *** Block No. 75, Hexblock 4b

\   codehandler: statics       19apr94pz

|| variable static-offset
|| variable static>

|| : clearstatic ( -- )
   static[ static> ! ;

~ : staticadr> ( -- current.adress )
     nolayout @  *nolayout* ?fatal
     static-offset @ static> @ - ;

~ : >staticadr ( adr -- )
     clearstatic
     static> @ + static-offset ! ;

~ : cstat, ( 8b -- )
     static> @ c!  1 static> +!
     static> @ ]static u< not
        IF flushstatic THEN ;

~ : stat, ( 16b -- )
     >lo/hi cstat, cstat, ;


\ *** Block No. 76, Hexblock 4c

\   codehandler : codelayout   11sep94pz

~ variable lib.first
~ variable code.first
~ variable code.last
~ variable statics.first
~ variable statics.libfirst
~ variable statics.last
~ variable lib.codename  15 allot
~ variable lib.initname  15 allot

~ : codelayout.ok  nolayout off ;

~ : end-of-code  ( -- )
     flushstatic
     flushcode
     staticadr> statics.first !
     pc         code.last     ! ;

\ *** Block No. 77, Hexblock 4d

\ codeoutput: flushcode/static 11sep94pz

make flushcode ( -- )
   code-file fsetout
   code[  pc >codeadr  over -  fputs
   funset  clearcode ;

make flushstatic ( -- )
   static-file fsetout
   static[  static> @  over - fputs
   static[ static> @ - static-offset +!
   funset  clearstatic ;

\ noch schlecht modularisiert:
\    greift auf interne worte des
\    codehandlers zurueck.

\prof [codehandler] end-bucket
