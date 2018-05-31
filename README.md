# Lab - Terraform

* _Criar uma infraestrutura como código (IaC) utilizando Terraform._

## Informações:

* _O Lab consiste em duas estapas:_

* **ETAPA 1**
   * 1)      A região e ID da conta devem estar em uma variável global;
   * 2)      Criar uma nova VPC com o nome “VPC_Terraform”;
   * 3)      Criar uma nova subnet 10.20.0.0/24 (a subnet deve estar especificada em uma variável para fácil alteração posterior);
   * 4)      Criar um bucket S3 que seja capaz de hospedar um site estático (você pode criar um index.html simples apenas neste S3);
   * 5)      Criar uma distribuição CloudFront e mapear o bucket S3 como origin para disponibilização do site estático na internet;
   * 6)      Criar um container FARGATE que seja capaz de servir um site estático (nginx + index.html com algum conteúdo simples);
   * 7)      Criar um Load Balancer e registrar o container FARGATE nele para disponibilizar o conteúdo do container de forma escalável;

* **ETAPA 2**
   * Criar um novo Branch no repositório e alterar (apenas neste branch) o terraform de forma que ele altere a infra-estrutura previamente criada:
   * 1)      Alterar o nome do Bucket S3 sem que a referência do mesmo no CloudFront ou seu funcionamento como hosting de site estático seja perdida;
   * 2)      Configurar o auto-scaling do container FARGATE para que ele seja automaticamente escalado sempre que o uso de memória ultrapassar 50%;
   * 3)      Alterar a subnet previamente criada setando seu escopo para 10.30.0.0/24 mantendo todos os recursos em funcionamento;

