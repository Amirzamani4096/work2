clc
clear
close all
w=dir;
for b=3:length(w)
    name=w(b).name;
    t=fopen(name,'r');
    y=fscanf(t,'%s');
    fclose(t);
    tw=findstr(name,'.');
    if name(tw+1:end)~='log'
        break
    end
    name(tw:end)=[];
    tr=findstr(name,'_');
    N=name(1:tr-1);
    K=name(tr+1:end);

    h=findstr(y,'elapsed=');
    time=y(h(end)+17:h(end)+19);

    h2=findstr(y,'CARRY');
    if ~isempty(h2)
        temp=y(h2(end):h2(end)+10);
        ind=findstr(temp,'|');
        k=1;
        for i=ind(1)+1:ind(1)+6
            if temp(i)=='|'
                break
            else
                CARRY(k)=temp(i);
                k=k+1;
            end
        end
    else
        CARRY='0';
    end
    clear temp k ind h2 
    
    h2=findstr(y,'LUT');
    temp=y(h2(end):h2(end)+10);
    ind=findstr(temp,'|');
    k=1;
    for i=ind(1)+1:ind(1)+6
        if temp(i)=='|'
            break
        else
            LUT(k)=temp(i);
            k=k+1;
        end
    end
    clear temp k ind h2
    
    h2=findstr(y,'IBUF');
    temp=y(h2(end):h2(end)+10);
    ind=findstr(temp,'|');
    k=1;
    for i=ind(1)+1:ind(1)+6
        if temp(i)=='|'
            break
        else
            IBUF(k)=temp(i);
            k=k+1;
        end
    end
    clear temp k ind h2
    
    h2=findstr(y,'OBUF');
    temp=y(h2(end):h2(end)+10);
    ind=findstr(temp,'|');
    k=1;
    for i=ind(1)+1:ind(1)+6
        if temp(i)=='|'
            break
        else
            OBUF(k)=temp(i);
            k=k+1;
        end
    end
    clear temp k ind h2
    
    results(b,:)=str2num([N ' ' K ' ' time ' ' CARRY ' ' LUT ' ' IBUF ' ' OBUF]);
    clear LUT CARRY IBUF OBUF time
end
p=sum(results(:,4:end),2);
results=[results p];
results(1:2,:)=[];
xlswrite('result.xlsx',results);
