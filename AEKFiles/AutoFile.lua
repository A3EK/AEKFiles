local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_aek(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAek:del(AEK.."aek:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_aek(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAek:set(AEK.."aek:Lock:AutoFile",true) 
end 
end

if (text and not DevAek:get(AEK.."aek:Lock:AutoFile")) then
Time = DevAek:get(AEK.."aek:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAek:smembers(AEK..'aek:Groups') 
local BotName = (DevAek:get(AEK.."aek:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..AEK..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAek:get(AEK.."aek:Groups:Links"..v)
Welcomes = DevAek:get(AEK..'aek:Groups:Welcomes'..v) or ''
aekConstructors = DevAek:smembers(AEK..'aek:aekConstructor:'..v)
BasicConstructors = DevAek:smembers(AEK..'aek:BasicConstructor:'..v)
Constructors = DevAek:smembers(AEK..'aek:Constructor:'..v)
Managers = DevAek:smembers(AEK..'aek:Managers:'..v)
Admis = DevAek:smembers(AEK..'aek:Admins:'..v)
Vips = DevAek:smembers(AEK..'aek:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #aekConstructors ~= 0 then
GetJson = GetJson..'"aekConstructors":['
for k,v in pairs(aekConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..AEK..'.json', "w")
File:write(GetJson)
File:close()
local aekan = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. aekan .. '" -F "chat_id='..DevId..'" -F "document=@'..AEK..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..AEK..'.json')
DevAek:set(AEK.."aek:AutoFile:Time",os.date("%x"))
end
else 
DevAek:set(AEK.."aek:AutoFile:Time",os.date("%x"))
end
end

end
return {
AEK = AutoFile
}