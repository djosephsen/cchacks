--setup the displays
displays={}
displays[1]=peripheral.wrap("back")
displays[2]=peripheral.wrap("right")
 
--set up wrappers for each tank
tanks={}
resevoirs={"tt_aspectContainer_0","tt_aspectContainer_1","tt_aspectContainer_2"}
for k,v in pairs(resevoirs) do
   tanks[k] = peripheral.wrap(v)
end
 
function measureTanks()
local essentia = {}
   for k,tank in pairs(tanks) do
      for o,aspect in pairs(tank.getAspects()) do
         if essentia[aspect]==nil then
            essentia[aspect]=0
         end
         essentia[aspect] = essentia[aspect] + tank.getAspectCount(aspect)
      end
   end
   return essentia
end
 
function printHeader(display)
   display.clear()
   display.setCursorPos(1,1)
   display.setTextColor(colors.blue)
   display.write("Essentia Resevoir Monitor 1.0")
end
 
function printData(data, display)
  display.setTextColor(colors.white)
  local myrow=2
  display.setCursorPos(1,2)
  for ess,val in pairs(data) do
      label=string.sub(ess, 1, 3)
      print(" datas : "..label..": "..val)
      display.write(ess..": "..val)
      myrow=myrow+1
      display.setCursorPos(1,myrow)
   end
end
 
function printFooter(display)
        print ("run: "..run)
        w,h = display.getSize()
        display.setCursorPos(1,h)
        display.setTextColor(colors.green)
        display.write("Monitoring: "..running[ run%3 ])
end
 
run=1
running={}
running[0]="-"
running[1]="/"
running[2]="|"
 
while true do
   data=measureTanks()
   for i,display in pairs(displays) do
      printHeader(display)
      printData(data,display)
      printFooter(display)
   end
   sleep(1)
   run=run+1
end
