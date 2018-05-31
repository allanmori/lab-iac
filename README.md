
# Lab - Terraform

* _Criar uma infraestrutura como código (IaC) utilizando Terraform._

## Informações:

* _O Lab consiste em duas estapas:_

* **ETAPA 1**

   *      A região e ID da conta devem estar em uma variável global;
   *      Criar uma nova VPC com o nome “VPC_Terraform”;
   *      Criar uma nova subnet 10.20.0.0/24 (a subnet deve estar especificada em uma variável para fácil alteração posterior);
   *      Criar um bucket S3 que seja capaz de hospedar um site estático (você pode criar um index.html simples apenas neste S3);
   *      Criar uma distribuição CloudFront e mapear o bucket S3 como origin para disponibilização do site estático na internet;
   *      Criar um container FARGATE que seja capaz de servir um site estático (nginx + index.html com algum conteúdo simples);
   *      Criar um Load Balancer e registrar o container FARGATE nele para disponibilizar o conteúdo do container de forma escalável;

* **ETAPA 2**
   *      Criar um novo Branch no repositório e alterar (apenas neste branch) o terraform de forma que ele altere a infra-estrutura previamente criada:
   *      Alterar o nome do Bucket S3 sem que a referência do mesmo no CloudFront ou seu funcionamento como hosting de site estático seja perdida;
   *      Configurar o auto-scaling do container FARGATE para que ele seja automaticamente escalado sempre que o uso de memória ultrapassar 50%;
   *      Alterar a subnet previamente criada setando seu escopo para 10.30.0.0/24 mantendo todos os recursos em funcionamento;

## Descrição (arquivos):
* _variables:_ Variáveis que os módulos vão utilizar
* _s3_bucket:_ Criação do Bucket e Site estático
* _cloudfront:_ Criação da CDN e apontamento para Origin Bucket
* _modules:_ Módulos para gerenciamento da Rede, Security Groups e ECS
  * _ecs:_ A pasta contém os arquivos para criação do Cluster ECS, Services e variáveis para o módulo.
  * _networking:_ Contém arquivos para criação da VPC, Subnets (pública e privada), Internet Gateway, Route Tables e Security Groups. 
  * _s3:_
  * _tasks:_ Contém arquivo .json para iniciar a task e criar o container ECS.
