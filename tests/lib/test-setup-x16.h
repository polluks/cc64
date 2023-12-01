
extern _fastcall tst_putc() *= 0xffd2;

int noconst(i)
int i;
{ return i; }

extern _fastcall tst__chkout() *= 0xffc9 ;
extern _fastcall tst_clrchn() *= 0xffcc ;

tst_chkout(int lfn)
{ tst__chkout(lfn<<8); }

#define tst_file_no 14

tst_print(char *s)
{
  tst_chkout(tst_file_no);
  while(*s != 0)
    tst_putc(*s++);
  tst_clrchn();
}

tst_println(s)
char *s;
{
  tst_chkout(tst_file_no);
  while(*s != 0)
    tst_putc(*s++);
  tst_putc('\n');
  tst_clrchn();
}

extern _fastcall tst_close() *= 0xffc3 ;
extern _fastcall tst__open() *= 0xffc0 ;

extern char tst_kernal_fnam_len *= 0x28f;
extern char tst_kernal_lfn *= 0x290;
extern char tst_kernal_sa *= 0x291;
extern char tst_kernal_fa *= 0x292;
extern int tst_kernal_fnam *= 0x8a;

tst_open(lfn, fa, sa, fnam)
char lfn, fa, sa;
char *fnam;
{
  char *p;
  for(p=fnam; *p; ++p);
  tst_kernal_fnam_len = p-fnam;
  tst_kernal_lfn = lfn;
  tst_kernal_fa = fa;
  tst_kernal_sa = sa;
  tst_kernal_fnam = fnam;
  tst__open();
}

char* tst_itoa(i)
int i;
{
  static char buffer[10];
  int n, d;
  if (i == -32768)
    return "-32768";
  n = 0;
  if (i < 0) {
    buffer[n++] = '-';
    i = -i;
  }
  if (i == 0) {
    buffer[n++] = '0';
  } else {
    d = 10000;
    while (d > i) { d /= 10; }
    while (d) {
      buffer[n++] = '0' + (i / d);
      i %= d;
      d /= 10;
    }
  }
  buffer[n] = 0;
  return buffer;
}

int failedAsserts = 0;

assertEq(actual, expected, message)
int actual;
int expected;
char *message;
{
  if (actual != expected) {
    tst_print("Assert failed: "); tst_print(message);
    tst_print(" Expected: "); tst_print(tst_itoa(expected));
    tst_print(" Actual: "); tst_println(tst_itoa(actual));
    ++failedAsserts;
  }
}

assertTrue(int expression, char *message)
{
  if (!expression) {
    tst_print("Assert failed: "); tst_println(message);
    ++failedAsserts;
  }
}

evaluateAsserts() {
  if (failedAsserts) {
    tst_print(tst_itoa(failedAsserts));
    tst_println(" assert(s) failed.");
  } else {
    tst_println("No assert failed.");
  }
  failedAsserts = 0;
}

static char abcde[] = "abcde";
static char abcdx[] = "abcdx";
static char teststring[] = "1234567890\nABCDEFGHIJKLMNOPQRSTUVWXYZ\nabcdefghijklmnopqrstuvwxyz\n";
