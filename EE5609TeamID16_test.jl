include("EE5609TeamID16.jl")
using JLD2
@load "Samples_Prog_1.jld2"


for i in 1:25
    A = Samples[i].A 
    b = Samples[i].b
    #print("i=",i,size(A),":")
    print("i=",i,":")
    
    #U,r,consistent = rankconsistencyTeamID16(A,b)
    @time U,r,consistent = rankconsistencyTeamID16(A,b)
    #print(typeof(U),typeof(r),typeof(consistent))

    if(U == Samples[i].U)
        print("U==U,")
    else
        print("U!=U,")
    end
    if(r == Samples[i].r)
        print("r==r,")
    else
        print("r!=r,")
    end
    if(consistent == Samples[i].consistent)
        print("consistent==consistent\n")
    else
        print("consistent!=consistent\n")
    end
   
end
