# 6. Desmantelar Infraestrutura

!!! tip "NO FINAL DESTE MÓDULO CONSEGUIRÁS"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Exercícios Bónus

Antes de desmantelares o projeto, dedica alguns minutos a uma exploração aberta.

!!! info "Experimenta Estes Tópicos de Exploração"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Desprovisionar Infraestrutura

!!! warning "Caso também tenhas concluído o exercício do agente hospedado GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Desmantelar infraestrutura é tão simples como:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirma o ambiente selecionado e revê os recursos a eliminar. Isto remove recursos do Azure e pode destruir dados. Mantém o pedido de confirmação para este fluxo de aprendizagem. Quando completo, verás um output semelhante a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifica a eliminação no portal e procura recursos fora do âmbito da implementação. O reporte de custos e atualizações das quotas podem sofrer atrasos. A configuração local `.azure` mantém-se a menos que a remova explicitamente.

1. `azd down --purge` solicita também a eliminação permanente dos recursos suportados que estejam em estado de eliminação suave. Usa-o apenas quando não for necessário recuperar e entendas as políticas de retenção/proteção contra purga. Não garante a liberação imediata da quota.

1. Não voltes a implementar só para verificar a limpeza. Uma `azd up` intencional posterior pode recriar recursos usando os inputs locais remanescentes, incorrendo em cobranças novamente. Atualizações do modelo normalmente usam mudanças de provisionamento suportadas, não o desmantelamento.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->