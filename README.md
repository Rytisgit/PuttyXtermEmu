# PuttyXtermEmulator
## An In-Memory UTF-8 XTerm Emulator based on Putty. 
#### Send escape codes and read the virtual screen to see what happened.

PuttyXtermEmulator uses a much cut-down version of putty, which leaves just the in-memory console handling. Putty is compiled as a library and used to parse the data sent to it by using the `Send` method. The terminal state can then be queried by calling the `GetLine` method. 

PuttyXtermEmu is compiled for Windows/Linux x86/x64 and WebAssembly (when using Uno Platform).

If trying to get x86 to work on x64 machines, the project which references PuttyXtermEmulator will likely need to set `<PlatformTarget>x86</PlatformTarget>`

## Install

```
> dotnet add package PuttyXtermEmulator
```

Or download `PuttyXtermEmulator` directly from [NuGet](https://www.nuget.org/packages/PuttyXtermEmulator).
## Example Usage
```
using Putty;
using System.Text;

namespace Test
{
    public class Program
    {
        private static void Main(string[] args)
        {
            int width = 80, height = 24;
            var term = new Terminal(width, height);

            var data = new TerminalCharacter[height, width];

            term.Send(Encoding.UTF8.GetBytes("\x1b[2J\x1b(B\x1b)0\x1b[?1049h\x1b[1;42r\x1b[m\x1b[4l\x1b[?1h\x1b=\x1b[39;49m\x1b[39;49m\x1b[m\x1b[H\x1b[J\x1b[42;1H\x1b[?1049l\r\x1b[?1l\x1b>\x1b[2J\x1b[?1h\x1b=\x1b[?1h\x1b=\x1b[?1049h\x1b[1;42r\x1b[39;49m\x1b[m\x1b[4l\x1b[H\x1b[J\x1b[H\x1b[J\x1b[1B ## nethack.alt.org - http://nethack.alt.org/\r\x1b[1B ##\x1b[1B\x08\x08## Games on this server are recorded for in-progress viewing and playback!\x1b[6;3HNot logged in.\x1b[8;3Hl) Login\x1b[9;3Hr) Register new user\x1b[10;3Hw) Watch games in progress\x1b[12;3Hs) server info\x1b[13;3Hm) MOTD/news (updated: 2010.09.22)\x1b[15;3Hq) Quit\x1b[19;3H=> "));

            for (int y = 0; y < height; ++y)
            {
                var line = term.GetLine(y);
                for (int x = 0; x < width; ++x)
                {
                    data[y, x] = line[x];
                    Console.Write(line[x].Character == 55328 ? " " : line[x].Character);
                }
                Console.WriteLine();
            }
        }
    }
}
```
##### Output:
```

 ## nethack.alt.org - http://nethack.alt.org/
 ##
 ## Games on this server are recorded for in-progress viewing and playback!

  Not logged in.

  l) Login
  r) Register new user
  w) Watch games in progress

  s) server info
  m) MOTD/news (updated: 2010.09.22)

  q) Quit



  =>
```