
%%% <Comment FunctionFile = "WT_GetD1_D6.m">
%%%     <Description>
%%%     ��ȡС���任ǰ�����ϸ��ϵ��
%%%     ��ͼʱȥ��0-0.02��0.13-0.15֮��ĵ�(ǰ���һ������)��������ԵЧӦ��Ӱ��
%%%     </Description>
%%%     <UseMyFunction> 
%%%     WT_DrawOneTwoLine.m;
%%%     </UseMyFunction> 
%%%     <InputParams>
%%%     @ v_filter  ����Ĵ�С���任���ź�
%%%     @ wname     С���任��������
%%%     @ level     С���任�Ĳ�����������ڵ���6��
%%%     @ ts_total  ����ʱ����ʱ�� 
%%%     @ titleStr  ��ʾfigure�ı���
%%%     @ isShowVin �Ƿ���ʾ��ʾ�����ѹ����
%%%     @ t1        ͼ���к�ɫ���ߵĺ�����1
%%%     @ t2        ͼ���к�ɫ���ߵĺ�����2
%%%     </InputParams>
%%%     <OutputParams>
%%%     @ cd1       ��һ��С���任��ϸ��ϵ��
%%%     @ cd2       �ڶ���С���任��ϸ��ϵ��
%%%     @ cd3       ������С���任��ϸ��ϵ��
%%%     @ cd4       ���Ĳ�С���任��ϸ��ϵ��
%%%     @ cd5       �����С���任��ϸ��ϵ��
%%%     @ cd6       ������С���任��ϸ��ϵ��
%%%     </OutputParams>
%%%     <Author>Han</Author> 
%%%     <LastRenewTime>2017/4/14</LastRenewTime>
%%% </Comment>

function [cd1,cd2,cd3,cd4,cd5,cd6] = WT_GetD1_D6(v_filter,wname,level,ts_total,titleStr,isShowVin,t1,t2)

%(��Ҫ)С���ֽ��ϵͳ����
[C,L] = wavedec(v_filter,level,wname);  
%(��Ҫ)С���ع���ϵͳ����
[cd1,cd2,cd3,cd4,cd5,cd6] = detcoef(C,L,[1,2,3,4,5,6]);     
%С���ع� 1����Ʒ���
ca1 = appcoef(C,L,wname,1);             
%С���ع� 2����Ʒ���
ca2 = appcoef(C,L,wname,2);            
%���һ��С��ϸ��ϵ���ĳ��� ��С��ϸ��ϵ���Ǹ�һά��������
size_cd1 = size(cd1);
lenth_cd1 = size_cd1(2);
%��ڶ���С��ϸ��ϵ���ĳ��� ��С��ϸ��ϵ���Ǹ�һά��������
size_cd2 = size(cd2);
lenth_cd2 = size_cd2(2);
%�������С��ϸ��ϵ���ĳ��� ��С��ϸ��ϵ���Ǹ�һά��������
size_cd3 = size(cd3);
lenth_cd3 = size_cd3(2);
%����Ĳ�С��ϸ��ϵ���ĳ��� ��С��ϸ��ϵ���Ǹ�һά��������
size_cd4 = size(cd4);
lenth_cd4 = size_cd4(2);
%������С��ϸ��ϵ���ĳ��� ��С��ϸ��ϵ���Ǹ�һά��������
size_cd5 = size(cd5);
lenth_cd5 = size_cd5(2);
%�������С��ϸ��ϵ���ĳ��� ��С��ϸ��ϵ���Ǹ�һά��������
size_cd6 = size(cd6);
lenth_cd6 = size_cd6(2);
%����С��ϸ��ϵ���ĳ��ȹ��컭ͼ��ʱ����
t_cd1 = linspace(0,ts_total,lenth_cd1);
t_cd2 = linspace(0,ts_total,lenth_cd2);
t_cd3 = linspace(0,ts_total,lenth_cd3);
t_cd4 = linspace(0,ts_total,lenth_cd4);
t_cd5 = linspace(0,ts_total,lenth_cd5);
t_cd6 = linspace(0,ts_total,lenth_cd6);

%ȥ����ԵЧӦ 
removeCount = 200;
cd1 = cd1(1:1,round(removeCount):length(cd1) - round(removeCount));
cd2 = cd2(1:1,round(removeCount/2):length(cd2) - round(removeCount/2));
cd3 = cd3(1:1,round(removeCount/4):length(cd3) - round(removeCount/4));
cd4 = cd4(1:1,round(removeCount/8):length(cd4) - round(removeCount/8));
cd5 = cd5(1:1,round(removeCount/16):length(cd5) - round(removeCount/16));
cd6 = cd6(1:1,round(removeCount/32):length(cd6) - round(removeCount/32));
t_cd1 = t_cd1(1:1,round(removeCount):length(t_cd1) - round(removeCount));
t_cd2 = t_cd2(1:1,round(removeCount/2):length(t_cd2) - round(removeCount/2));
t_cd3 = t_cd3(1:1,round(removeCount/4):length(t_cd3) - round(removeCount/4));
t_cd4 = t_cd4(1:1,round(removeCount/8):length(t_cd4) - round(removeCount/8));
t_cd5 = t_cd5(1:1,round(removeCount/16):length(t_cd5) - round(removeCount/16));
t_cd6 = t_cd6(1:1,round(removeCount/32):length(t_cd6) - round(removeCount/32));

%�½�figure
h = figure;
%����figure�ı���
str1 = 'С���任������7;';
str2 = 'С���任������';
set(h,'name',[titleStr,str1,str2,wname],'Numbertitle','off');
%lineLength = -0.1:0.001:0.1;
if isShowVin == 0
    %������ϸ��ϵ����ͼ
    subplot(231);
    plot(t_cd1,cd1);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd1,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd1,t1);
        hold off
    end
    subplot(232);
    plot(t_cd2,cd2);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd2,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd2,t1);
        hold off
    end
    subplot(233);
    plot(t_cd3,cd3);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd3,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd3,t1);
        hold off
    end
    subplot(234);
    plot(t_cd4,cd4);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd4,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd4,t1);
        hold off
    end
    subplot(235);
    plot(t_cd5,cd5);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd5,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd5,t1);
        hold off
    end
    subplot(236);
    plot(t_cd6,cd6);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd6,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd6,t1);
        hold off
    end
    xlabel('ʱ��/t');
    set(gca,'Fontname','times new Roman'); 
    set(get(gca,'XLabel'),'Fontname','times new Roman');
    set(get(gca,'YLabel'),'Fontname','times new Roman');
end
if isShowVin == 1
    subplot(711);
    t = linspace(0,ts_total,length(v_filter));
    t = t(1:1,round(removeCount * 2):length(t) - round(removeCount * 2));
    v_filter = v_filter(1:1,round(removeCount * 2):length(v_filter) - round(removeCount * 2));
    plot(t,v_filter);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        line_lenth = -300:1:300;
        hold on 
        drawLineY = line_lenth;
        drawLineX = t1;
        plot(drawLineX,drawLineY,'r');
        set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
        drawLineY = line_lenth;
        drawLineX = t2;
        plot(drawLineX,drawLineY,'r');
        set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
        hold off
    end
    if nargin == 7
        line_lenth = -300:1:300;
        hold on 
        drawLineY = line_lenth;
        drawLineX = t1;
        plot(drawLineX,drawLineY,'r');
        set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
        hold off
    end
    subplot(712);
    plot(t_cd1,cd1);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd1,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd1,t1);
        hold off
    end
    subplot(713);
    plot(t_cd2,cd2);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd2,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd2,t1);
        hold off
    end
    subplot(714);
    plot(t_cd3,cd3);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd3,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd3,t1);
        hold off
    end
    subplot(715);
    plot(t_cd4,cd4);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd4,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd4,t1);
        hold off
    end
    subplot(716);
    plot(t_cd5,cd5);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd5,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd5,t1);
        hold off
    end
    subplot(717);
    plot(t_cd6,cd6);
    set(gca,'Fontname','times new Roman'); 
set(get(gca,'XLabel'),'Fontname','times new Roman');
set(get(gca,'YLabel'),'Fontname','times new Roman');
    if nargin == 8
        hold on 
        WT_DrawOneTwoLine(cd6,t1,t2);
        hold off
    end
    if nargin == 7
        hold on 
        WT_DrawOneTwoLine(cd6,t1);
        hold off
    end
    xlabel('ʱ��/t');
    set(gca,'Fontname','times new Roman'); 
    set(get(gca,'XLabel'),'Fontname','times new Roman');
    set(get(gca,'YLabel'),'Fontname','times new Roman');
end

