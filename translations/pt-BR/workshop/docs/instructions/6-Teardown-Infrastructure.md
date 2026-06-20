# 6. Encerrar Infraestrutura

!!! tip "AO FINAL DESTE MÓDULO VOCÊ PODERÁ"

    - [ ] Compreender a importância da limpeza de recursos e do gerenciamento de custos
    - [ ] Usar `azd down` para desprovisionar a infraestrutura com segurança
    - [ ] Recuperar serviços Azure AI que foram soft-deleted, se necessário
    - [ ] **Laboratório 6:** Limpar recursos do Azure e verificar a remoção

---

## Exercícios Bônus

Antes de encerrarmos o projeto, reserve alguns minutos para fazer uma exploração livre.

!!! info "Experimente estes prompts de exploração"

    **Experimente o GitHub Copilot:**
    
    1. Pergunte: `What other AZD templates could I try for multi-agent scenarios?`
    2. Pergunte: `How can I customize the agent instructions for a healthcare use case?`
    3. Pergunte: `What environment variables control cost optimization?`
    
    **Explore o Portal do Azure:**
    
    1. Verifique as métricas do Application Insights para sua implantação
    2. Verifique a análise de custos dos recursos provisionados
    3. Explore o playground de agentes do portal Microsoft Foundry mais uma vez

---

## Desprovisionar Infra

1. Desprovisionar a infraestrutura é tão simples quanto:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. A flag `--purge` garante que ele também purgue recursos do Cognitive Service que foram soft-deleted, liberando assim a cota ocupada por esses recursos. Uma vez concluído você verá algo assim:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcional) Se você agora executar `azd up` novamente, perceberá que o modelo gpt-4.1 é implantado, já que a variável de ambiente foi alterada (e salva) na pasta local `.azure`. 

      Aqui estão as implantações do modelo **antes**:

      ![Inicial](../../../../../translated_images/pt-BR/14-deploy-initial.30e4cf1c29b587bc.webp)

      E aqui está **depois**:
      ![Novo](../../../../../translated_images/pt-BR/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->