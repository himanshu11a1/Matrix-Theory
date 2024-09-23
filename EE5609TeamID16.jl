#EE5609
#Programming Assignment-1
#Team ID - 16
#Team Members
# 1) ANDRA SIVA SAI TEJA - AI22MTECH11001
# 2) HIMANSHU SHARMA - AI22MTECH12008

#NOTE:
# 1) This .jl file contains the function "rankconsistencyTeamID16" 
#    that returns to ref,rank,consistency
# 2) This file also contains some intermediatory functions
#    those have been used in between 

function rowSwap(M,i,j)
    m,n = size(M)
    max = M[i,j]
    index = i
    for k in i:m
        if(M[k,j] > max)
            max = M[k,j]
            index = k
        end
    end
    
    if(max!=M[i,j])
        row_index = M[index,:]
        M[index,:] = M[i,:]
        M[i,:] = row_index
    end
    return M
end

function multiplier(p,q)
        temp = [1 2 3;3 1 2;2 3 1]
        return temp[p,q]
end

function multiplyF4Vector(v1,mult,j)
    v = v1*0
    temp = [0 0 0 0;0 1 2 3;0 2 3 1;0 3 1 2]
    for i in j:length(v1)
        v[i] = temp[v1[i]+1,mult+1]
    end
    return v
end

function addF4Vectors(v1,v2,j)
    v = v1*0
    temp = [0 1 2 3;1 0 3 2;2 3 0 1;3 2 1 0]
    for i in j:length(v1)
        v[i] = temp[v1[i]+1,v2[i]+1]
    end
    return v
end

function makeZeroUsing(M,k,i,j)
    p = M[i,j] #pivot
    q = M[k,j]
    
    if(q != 0)
        mult = multiplier(p,q)
        pivot_row = M[i,:]
        below_row = M[k,:]
        pivot_row_multiplied = multiplyF4Vector(pivot_row,mult,j)
        M[k,:] = addF4Vectors(pivot_row_multiplied,below_row,j)
    end
    return M
end

function rankconsistencyTeamID16(A,b)
    #partial pivoting
    m,n = size(A)
    A0 = [A b]
    U0 = copy(A0)
    i = 1
    j = 1
    while((i<m)&&(j<=n+1))
        U0 = rowSwap(U0,i,j)
        if(U0[i,j]==0)
            j = j + 1
        else
            for k in i+1:m 
                U0 = makeZeroUsing(U0,k,i,j)
            end
                i = i + 1
                j = j + 1
        end
    end

    U = U0[1:m,1:n]

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

    r1 = r #rank of A
    r2 = r0 #rank of [A b]
    if(r1==r2)
        return U,r,true
    else
        return U,r,false
    end
end

#END