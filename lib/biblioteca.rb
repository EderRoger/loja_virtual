class  Biblioteca
	
	attr_reader :livros

	def  initialize
		#@livros = {} #inicializa com um hash
		#inicializa com um Banco de Arquivos
		@banco_de_arquivos = BancoDeArquivos.new
	end

	def adiciona(livro)
		salva livro do
			#@livros[livro.categoria] ||= []
		    #@livros[livro.categoria] << livro
		    livros << livro
	    end
	end

	def livros_por_categoria(categoria)
		#@livros[categoria].each do |livro|
		#	yield livro if block_given?
		#end	
		livros.select{ |livro| livro.categoria == categoria }
	end

    def livros
    	@livros ||= @banco_de_arquivos.carrega
    end

	private

	def salva(livro)
		@banco_de_arquivos.salva livro
        yield
	end
end
 