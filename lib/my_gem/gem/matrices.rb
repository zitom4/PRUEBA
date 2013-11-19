require "/home/alu4101/datos/homes.rala/LPP/prct07/lib/fraccion.rb"
require "/home/alu4101/datos/homes.rala/LPP/prct09/my-gem/lib/my_gem/gem/matrices_dispersas.rb"
class Matriz
    
  attr_accessor :fil, :col, :valor
  
    def initialize(m,n)
      @fil,@col = m, n
      @valor=Array.new(@fil,0)
      i=0      
      while i < @fil
	 @valor[i]=Array.new(@col,0)
	 i=i+1
      end
   end
    #################### METODO NUMERO DE VALORES NULOS ###########################
   
   
   
    def metodo

      @cnt=0
      k=0
     while k<@fil
	 r=0
	while r<@col 
	  puts @valor[k][r]
	  if (@valor[k][r]==0)
	    @cnt=@cnt+1
	  end
	  r=r+1
	end
	k=k+1
      end
      if (((@fil*@col)*0.6) < @cnt)  # SI el 60% de la matriz es nula
	puts " LA MATRIZ ES DISPERSA "
	MatrizDispersa.new(@fil,@col,@valor)
        end
    end
    

    ########################## METODO [] ##################################
    
    
    def [](i)
      @valor[i]
    end
    
    
    ########################### METODO []= #################################
    def []=(i,other)
      @valor[i] = other
    end
    
    
############# METODO REPRESENTAR UNA CADENA ##############  
    def to_s
      i=0
      cadena= ""
       while i<@fil
	    j=0
	    while j<@col
	      cadena+="#{valor[i][j]} "
	      j=j+1
	    end
	    
	  cadena+="\n "
	  i=i+1
	end
     cadena
     
    end
    
 ############ METODO SUMA DE MATRICES#############
    def +(other) 
      
      aux=Matriz.new(@col,@fil)
      i=0
     
	while i<@fil
	   j=0
	  while j<@col
	    aux[i][j]= valor[i][j] + other[i][j]
	    j=j+1
	  end
	
	  i=i+1
	end
      aux
    end
    
############ METODO MULTIPLICAR UNA MATRIZ ###########
    
    
    def *(other)
      
      aux=Matriz.new(@col,@fil)
      i=0
      while i < @fil
	j = 0
	while j < other.col
	  k = 0
	  while k < @col
	    aux[i][j] = (aux[i][j] + valor[i][k])*other[i][k]
	    k=k+1
	  end
	  j=j+1
	end
	i=i+1
      end
      aux
    end
    
    
############ METODO RESTA DE MATRICES ##################
    
    
    
    def -(other)
       aux=Matriz.new(@col,@fil)
      i=0
     
	while i<@fil
	   j=0
	  while j<@col
	    aux[i][j]= valor[i][j] - other[i][j]
	    j=j+1
	  end
	
	  i=i+1
	end
      aux
        
     @valor=Array.new(@fil,0.0)
  end     
 ########################## METODO == #########################3     
    def ==(other)
      i=0
	while i<@fil
	  j=0
	  while j<@col
	    if 
	      valor[i][j] == other[i][j]
	      j=j+1
	    else
	      return false
	    end
	  end
	end
    end
      
      
end

   @M2 = Matriz.new(2,2)
	@M2[0]=[0,0]
	@M2[1]=[0,3]
   @M2.metodo
    