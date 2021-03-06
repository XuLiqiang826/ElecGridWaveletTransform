
%%% <Comment FunctionFile = "WT_GetDataCompare.m">
%%%     <Description>
%%%     比较四种小波变换方式细节系数cd1，cd2的异同
%%%     </Description>
%%%     <InputParams>
%%%     @ wname1           小波变换方式名称1
%%%     @ wname2           小波变换方式名称2
%%%     @ wname3           小波变换方式名称3
%%%     @ wname4           小波变换方式名称4
%%%     @ level            小波变换分解的层数
%%%     @ v_filter         待小波变换信号
%%%     @ ts_total         采样总时长 
%%%     </InputParams>
%%%     <OutputParams>
%%%     Null
%%%     </OutputParams>
%%%     <Author>Han</Author> 
%%%     <LastRenewTime>2017/4/13</LastRenewTime>
%%% </Comment>

function WT_GetDataCompare(wname1,wname2,wname3,wname4,level,v_filter,ts_total)

%新建figure
h = figure;
%设置figure标题
set(h,'name',['小波变换方式：',wname1,',',wname2,',',wname3,',',wname4,'的细节系数cd1和cd2的比较'],'Numbertitle','off');
%(重要)小波分解的系统函数
[C,L] = wavedec(v_filter,level,wname1);  
%(重要)小波重构的系统函数
[cd1,cd2] = detcoef(C,L,[1,2]);    
%求第一层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd1 = size(cd1);
lenth_cd1 = size_cd1(2);
%求第二层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd2 = size(cd2);
lenth_cd2 = size_cd2(2);
%根据小波细节系数的长度构造画图的时间轴
t_cd1 = linspace(0,ts_total,lenth_cd1);
t_cd2 = linspace(0,ts_total,lenth_cd2);
%画wname1的小波细节系数cd1、cd2的图
subplot(241);
plot(t_cd1,cd1);
xlabel('细节系数d1');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
subplot(245);
plot(t_cd2,cd2);
xlabel('细节系数d2');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
%(重要)小波分解的系统函数
[C,L] = wavedec(v_filter,level,wname1);  
%(重要)小波重构的系统函数
[cd1,cd2] = detcoef(C,L,[1,2]);    
%求第一层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd1 = size(cd1);
lenth_cd1 = size_cd1(2);
%求第二层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd2 = size(cd2);
lenth_cd2 = size_cd2(2);
%根据小波细节系数的长度构造画图的时间轴
t_cd1 = linspace(0,ts_total,lenth_cd1);
t_cd2 = linspace(0,ts_total,lenth_cd2);
%画wname2的小波细节系数cd1、cd2的图
subplot(242);
plot(t_cd1,cd1);
xlabel('细节系数d1');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
subplot(246);
plot(t_cd2,cd2);
xlabel('细节系数d2');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
%(重要)小波分解的系统函数
[C,L] = wavedec(v_filter,level,wname1);  
%(重要)小波重构的系统函数
[cd1,cd2] = detcoef(C,L,[1,2]);    
%求第一层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd1 = size(cd1);
lenth_cd1 = size_cd1(2);
%求第二层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd2 = size(cd2);
lenth_cd2 = size_cd2(2);
%根据小波细节系数的长度构造画图的时间轴
t_cd1 = linspace(0,ts_total,lenth_cd1);
t_cd2 = linspace(0,ts_total,lenth_cd2);
%画wname3的小波细节系数cd1、cd2的图
subplot(243);
plot(t_cd1,cd1);
xlabel('细节系数d1');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
subplot(247);
plot(t_cd2,cd2);
xlabel('细节系数d2');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
%(重要)小波分解的系统函数
[C,L] = wavedec(v_filter,level,wname1);  
%(重要)小波重构的系统函数
[cd1,cd2] = detcoef(C,L,[1,2]);    
%求第一层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd1 = size(cd1);
lenth_cd1 = size_cd1(2);
%求第二层小波细节系数的长度 （小波细节系数是个一维的向量）
size_cd2 = size(cd2);
lenth_cd2 = size_cd2(2);
%根据小波细节系数的长度构造画图的时间轴
t_cd1 = linspace(0,ts_total,lenth_cd1);
t_cd2 = linspace(0,ts_total,lenth_cd2);
%画wname4的小波细节系数cd1、cd2的图
subplot(244);
plot(t_cd1,cd1);
xlabel('细节系数d1');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
subplot(248);
plot(t_cd2,cd2);
xlabel('细节系数d2');
set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
