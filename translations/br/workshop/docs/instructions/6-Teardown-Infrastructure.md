<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T14:56:13+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "br"
}
-->
# 6. Desmontar Infraestrutura

!!! tip "AO FINAL DESTE MÓDULO VOCÊ SERÁ CAPAZ DE"

    - [ ] Item
    - [ ] Item
    - [ ] Item

---

## Exercícios Extras

Antes de desmontar o projeto, reserve alguns minutos para fazer uma exploração aberta.

!!! danger "NITYA-TODO: Esboçar algumas sugestões para experimentar"

---

## Desprovisionar Infraestrutura

1. Desmontar a infraestrutura é tão simples quanto:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. A flag `--purge` garante que também sejam eliminados os recursos de Serviço Cognitivo que foram excluídos de forma suave, liberando assim a cota ocupada por esses recursos. Após a conclusão, você verá algo como isto:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcional) Se você executar `azd up` novamente agora, perceberá que o modelo gpt-4.1 será implantado, já que a variável de ambiente foi alterada (e salva) na pasta local `.azure`.

      Aqui estão as implantações do modelo **antes**:

      ![Inicial](../../../../../translated_images/br/14-deploy-initial.30e4cf1c29b587bc.png)

      E aqui estão **depois**:
      ![Novo](../../../../../translated_images/br/14-deploy-new.f7f3c355a3cf7299.png)

---

