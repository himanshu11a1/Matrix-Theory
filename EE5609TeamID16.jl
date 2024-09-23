#EE5609
#Programming Assignment-1
#Team ID - 16
#Team Members
# 1) ANDRA SIVA SAI TEJA - AI22MTECH11001
# 2) HIMANSHU - AI22MTECH12008
 

function makeZeroUsing(M,m,n,i,j,temp1,temp2,temp3)
    p = M[i,j] #pivot
    for k in i+1:m 
        q = M[k,j]
        if(q != 0)
            for t in j:n+1
                M[k,t] = temp3[temp2[M[i,t]+1,temp1[p, q]+1]+1,M[k,t]+1]
            end
        end
    end
    return M
end

function rankconsistencyTeamID16(A,b)
    #partial pivoting
    A = convert(Array{Int8},A)
    b = convert(Array{Int8},b)
    m,n = size(A)
    U0 = [A b]
    i = 1
    j = 1
    temp1 = [1 2 3;3 1 2;2 3 1]
    temp2 = [0 0 0 0;0 1 2 3;0 2 3 1;0 3 1 2]
    temp3 = [0 1 2 3;1 0 3 2;2 3 0 1;3 2 1 0]
    temp1 = convert(Array{Int8},temp1)
    temp2 = convert(Array{Int8},temp2)
    temp3 = convert(Array{Int8},temp3)
    
    while((i<=m-1)&&(j<=n+1))
        if(U0[i,j]!=3)
            max = U0[i,j]
            index = i
            for k in i:m
                if(max == 3)
                    break
                end
                if(U0[k,j] > max)
                    max = U0[k,j]
                    index = k
                end
            end
            
            if(max!=U0[i,j])
                row_index = U0[index,:]
                U0[index,:] = U0[i,:]
                U0[i,:] = row_index
            end
        end
        if(U0[i,j]==0)
            j = j + 1
        else
            U0 = makeZeroUsing(U0,m,n,i,j,temp1,temp2,temp3)
            i = i + 1
            j = j + 1
        end
    end
    
    U = U0[1:m,1:n]

    #U0 is ref of [A b]
    #U is ref of A

    r0 = 0
    r = 0
    i = 1
    j = 1
    
    while((i<=m)&&(j<=n+1))
        if(U0[i,j] != 0)
            if(j<=n)
                r = r + 1
            end
            r0 = r0 + 1
            i = i + 1
            j = j + 1
        else
            j = j + 1
        end
    end
    
    #r is rank of A
    #r0 is rank of [A b]

    U = convert(Array{Int64},U)
    
    if(r==r0)
        return U,r,true
    else
        return U,r,false
    end
end

#END