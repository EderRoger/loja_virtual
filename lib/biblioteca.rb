class  Bibilioteca
	
	include Enumerable

	def  initialize
		#@livros = {} #inicializa com um hash
		#inicializa com um Banco de Arquivos
		@banco_de_arquivos = BancoDeArquivos.new
	end

	def adiciona(midia)
		salva midia do
			#@livros[livro.categoria] ||= []
		    #@livros[livro.categoria] << livro
		    midias << midia
	    end# if midia.kind_of? Midia
	end

	def midias_por_categoria(categoria)
		#@livros[categoria].each do |livro|
		#	yield livro if block_given?
		#end	
		midias.select do  |midia| 
		   midia.categoria == categoria id midia.respond_to? :categoria }
		end	
	end

    def midias
    	@midias ||= @banco_de_arquivos.carrega
    end

    def each
    	midias.each { |midia| yield midia }
    end

	private

	def salva(midia)
		@banco_de_arquivos.salva midia
        yield
	end
end
 