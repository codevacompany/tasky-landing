# Guia de Criptografia de Dados - Tasky Pro

**Conformidade LGPD e Boas Práticas de Segurança**

---

## 📋 VISÃO GERAL

A LGPD não especifica explicitamente quais dados devem ser criptografados, mas estabelece que o controlador deve adotar medidas técnicas e organizacionais adequadas para proteger os dados pessoais. A criptografia é uma das principais medidas técnicas recomendadas.

---

## 🔐 DADOS QUE DEVEM SER CRIPTOGRAFADOS

### 1. **DADOS OBRIGATÓRIOS - CRÍTICOS**

#### Senhas e Credenciais
- ✅ **Senhas de usuários**: Sempre usar hash (bcrypt, argon2, scrypt) - **NUNCA** texto plano
- ✅ **Tokens de autenticação**: JWT tokens, refresh tokens, session tokens
- ✅ **Chaves de API**: Todas as chaves de API e secrets
- ✅ **Credenciais de acesso**: Senhas de banco de dados, chaves SSH, certificados

**Implementação**:
- Hash com salt (bcrypt com cost factor mínimo 10)
- Tokens com expiração e rotação
- Armazenamento de secrets em variáveis de ambiente ou gerenciadores de secrets (AWS Secrets Manager, HashiCorp Vault)

---

#### Dados Pessoais Sensíveis (Art. 5º, II, LGPD)
- ✅ **CPF**: Criptografar em repouso
- ✅ **CNPJ**: Criptografar em repouso
- ✅ **Dados biométricos**: Se coletados, criptografia obrigatória
- ✅ **Dados de saúde**: Se coletados, criptografia obrigatória
- ✅ **Dados de crianças/adolescentes**: Proteção reforçada

**Implementação**:
- Criptografia AES-256 em repouso
- Campos específicos no banco de dados com criptografia de coluna
- Considerar criptografia de nível de aplicação para campos específicos

---

#### Informações de Pagamento
- ✅ **Dados de cartão de crédito**: Processados pelo Stripe (PCI-DSS compliance)
- ✅ **Dados bancários**: Se coletados diretamente
- ✅ **Histórico de transações**: Criptografar em repouso

**Nota**: Como a Tasky Pro usa Stripe, os dados de pagamento não são armazenados diretamente. O Stripe é responsável pela conformidade PCI-DSS.

---

### 2. **DADOS RECOMENDADOS - ALTA PRIORIDADE**

#### Dados Pessoais Identificadores
- ✅ **E-mail**: Criptografar em repouso (recomendado)
- ✅ **Telefone**: Criptografar em repouso (recomendado)
- ✅ **Endereço completo**: CEP, rua, número, complemento
- ✅ **Nome completo**: Primeiro nome e sobrenome

**Justificativa**: Embora não sejam "sensíveis" segundo a LGPD, são dados pessoais que podem ser usados para identificação e devem ter proteção adequada.

---

#### Conteúdo do Usuário
- ✅ **Arquivos anexados**: Todos os arquivos enviados pelos usuários
- ✅ **Comentários e mensagens**: Se contiverem dados pessoais
- ✅ **Tarefas e projetos**: Se contiverem informações confidenciais

**Implementação**:
- Criptografia de arquivos em armazenamento (S3 com server-side encryption)
- Criptografia de backups de arquivos
- Considerar criptografia de nível de aplicação para conteúdo muito sensível

---

#### Dados de Logs e Auditoria
- ✅ **Logs que contenham dados pessoais**: E-mails, IPs, ações do usuário
- ✅ **Logs de acesso**: Registros de login, acessos a dados sensíveis
- ✅ **Logs de auditoria**: Alterações em dados pessoais

**Implementação**:
- Anonimização ou pseudonimização quando possível
- Criptografia de logs em repouso
- Retenção limitada conforme política de retenção

---

### 3. **DADOS OPCIONAIS - BOAS PRÁTICAS**

#### Metadados e Analytics
- ⚠️ **Dados de uso**: Se contiverem identificadores pessoais
- ⚠️ **Cookies e tracking**: Se armazenarem dados pessoais
- ⚠️ **Métricas de comportamento**: Se identificarem usuários

**Recomendação**: Pseudonimizar ou anonimizar quando possível.

---

## 🔒 TIPOS DE CRIPTOGRAFIA NECESSÁRIOS

### 1. **Criptografia em Trânsito (Transport Layer Security)**

**Obrigatória para TODAS as comunicações**:
- ✅ HTTPS/TLS 1.2+ para todas as conexões web
- ✅ TLS para APIs e comunicação entre serviços
- ✅ Criptografia para comunicação com banco de dados
- ✅ Certificados SSL válidos e atualizados

**Implementação**:
- TLS 1.3 quando possível (mais seguro)
- Certificados SSL/TLS válidos (Let's Encrypt, AWS Certificate Manager)
- HSTS (HTTP Strict Transport Security) habilitado
- Verificação de certificados em todas as conexões

---

### 2. **Criptografia em Repouso (At Rest)**

#### Banco de Dados
- ✅ **Criptografia de disco**: Criptografia de volume/disk encryption
- ✅ **Criptografia de coluna**: Para campos sensíveis específicos
- ✅ **Criptografia de nível de aplicação**: Para dados muito sensíveis
- ✅ **Criptografia de backups**: Todos os backups devem ser criptografados

**Implementação**:
- PostgreSQL: pgcrypto extension para criptografia de coluna
- AWS RDS: Encryption at rest habilitado
- Chaves de criptografia gerenciadas (AWS KMS, Azure Key Vault)

---

#### Armazenamento de Arquivos
- ✅ **Criptografia de objetos**: S3 server-side encryption (SSE)
- ✅ **Criptografia de nível de aplicação**: Para arquivos muito sensíveis
- ✅ **Criptografia de backups**: Backups de arquivos criptografados

**Implementação**:
- AWS S3: SSE-S3 ou SSE-KMS
- Criptografia antes do upload para arquivos muito sensíveis
- Chaves de criptografia rotacionadas regularmente

---

## 📊 MATRIZ DE CRIPTOGRAFIA POR TIPO DE DADO

| Tipo de Dado | Em Trânsito | Em Repouso | Método Recomendado | Prioridade |
|--------------|-------------|------------|-------------------|------------|
| **Senhas** | ✅ TLS | ✅ Hash (bcrypt) | bcrypt/argon2 | 🔴 Crítica |
| **CPF/CNPJ** | ✅ TLS | ✅ AES-256 | Criptografia de coluna | 🔴 Crítica |
| **E-mail** | ✅ TLS | ⚠️ Recomendado | AES-256 | 🟠 Alta |
| **Telefone** | ✅ TLS | ⚠️ Recomendado | AES-256 | 🟠 Alta |
| **Endereço** | ✅ TLS | ⚠️ Recomendado | AES-256 | 🟠 Alta |
| **Arquivos** | ✅ TLS | ✅ SSE | S3 SSE-KMS | 🟠 Alta |
| **Tokens** | ✅ TLS | ✅ Hash | JWT com assinatura | 🔴 Crítica |
| **Logs** | ✅ TLS | ⚠️ Anonimizar | Pseudonimização | 🟡 Média |
| **Backups** | ✅ TLS | ✅ Obrigatório | AES-256 | 🔴 Crítica |

---

## 🛠️ IMPLEMENTAÇÃO TÉCNICA

### Checklist de Implementação

#### Infraestrutura
- [ ] TLS 1.2+ habilitado em todos os serviços
- [ ] Certificados SSL válidos e auto-renováveis
- [ ] HSTS configurado
- [ ] Criptografia de disco habilitada no banco de dados
- [ ] Criptografia de volume habilitada em servidores

#### Banco de Dados
- [ ] Senhas armazenadas com hash (bcrypt/argon2)
- [ ] CPF/CNPJ criptografados em colunas específicas
- [ ] Chaves de criptografia gerenciadas (KMS)
- [ ] Backups criptografados
- [ ] Conexões ao banco criptografadas (SSL)

#### Armazenamento de Arquivos
- [ ] S3 com server-side encryption habilitado
- [ ] SSE-KMS para arquivos sensíveis
- [ ] Política de bucket que exige criptografia
- [ ] Backups de arquivos criptografados

#### Aplicação
- [ ] Tokens JWT assinados e criptografados
- [ ] Secrets em variáveis de ambiente ou gerenciador
- [ ] Criptografia de nível de aplicação para dados críticos
- [ ] Rotação de chaves implementada

#### Logs e Monitoramento
- [ ] Dados pessoais removidos ou anonimizados dos logs
- [ ] Logs criptografados em repouso
- [ ] Retenção limitada de logs com dados pessoais

---

## ⚠️ DADOS QUE NÃO PRECISAM DE CRIPTOGRAFIA ESPECIAL

Estes dados ainda precisam de proteção adequada, mas não necessariamente criptografia:

- **Dados públicos**: Informações já disponíveis publicamente
- **Dados agregados/anônimos**: Dados que não identificam indivíduos
- **Metadados não identificadores**: Timestamps, tipos de arquivo, etc.

**Nota**: Mesmo dados não sensíveis devem ser protegidos por outras medidas (controle de acesso, autenticação, etc.).

---

## 📋 CONFORMIDADE E VALIDAÇÃO

### Testes de Segurança
- [ ] Verificar que senhas nunca são armazenadas em texto plano
- [ ] Testar que dados sensíveis estão criptografados em repouso
- [ ] Validar que todas as conexões usam TLS
- [ ] Verificar que backups estão criptografados
- [ ] Testar rotação de chaves de criptografia

### Auditoria
- [ ] Documentar algoritmos de criptografia utilizados
- [ ] Registrar quando e como as chaves são rotacionadas
- [ ] Manter logs de acesso a dados criptografados
- [ ] Revisar políticas de criptografia anualmente

---

## 🔗 REFERÊNCIAS

- **LGPD Art. 46**: Medidas técnicas e organizacionais adequadas
- **ISO/IEC 27001**: Controles de segurança da informação
- **OWASP**: OWASP Cryptographic Storage Cheat Sheet
- **NIST**: Guidelines for Cryptography

---

## 📞 DÚVIDAS

Para questões sobre implementação de criptografia:
- **Técnico**: Equipe de Desenvolvimento
- **Jurídico/LGPD**: privacidade@taskypro.com.br

---

**Última atualização**: Janeiro de 2025  
**Próxima revisão**: Julho de 2025

