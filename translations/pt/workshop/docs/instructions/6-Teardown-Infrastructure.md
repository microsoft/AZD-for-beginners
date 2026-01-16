<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T10:00:42+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "pt"
}
-->
# 6. Desmontar Infraestrutura

!!! tip "NO FINAL DESTE MÓDULO, SERÁ CAPAZ DE"

    - [ ] Item
    - [ ] Item
    - [ ] Item

---

## Exercícios Bónus

Antes de desmontar o projeto, reserve alguns minutos para fazer uma exploração mais aberta.

!!! danger "NITYA-TODO: Esboçar algumas sugestões para experimentar"

---

## Desprovisionar Infraestrutura

1. Desmontar a infraestrutura é tão simples como:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. O parâmetro `--purge` garante que também elimina recursos de Cognitive Service que foram eliminados de forma suave, libertando assim a quota ocupada por esses recursos. Uma vez concluído, verá algo como isto:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcional) Se executar novamente `azd up`, irá notar que o modelo gpt-4.1 será implementado, uma vez que a variável de ambiente foi alterada (e guardada) na pasta local `.azure`.

      Aqui estão as implementações do modelo **antes**:

      ![Inicial](../../../../../translated_images/pt/14-deploy-initial.30e4cf1c29b587bc.png)

      E aqui estão **depois**:
      ![Novo](../../../../../translated_images/pt/14-deploy-new.f7f3c355a3cf7299.png)

---

