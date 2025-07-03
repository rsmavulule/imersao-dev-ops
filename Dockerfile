FROM python:3.13.5-alpine3.22

# Define o directório de trabalho dentro do conteiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependencias
# Usamos o --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código para o directório de trabalho
COPY . .

# Expõe a porta que a aplicação FastAPI irá rodar (padrão 8000)
EXPOSE 8000

# Comando para rodar a aplicação usando uvicorn
# O hoste 0.0.0.0 permite que a aplicação seja acessivel externamente ao container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]