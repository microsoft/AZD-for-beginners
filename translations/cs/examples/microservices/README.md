# Příklad mikroservis

Spustitelná implementace a její instrukce jsou v
**[container-app/microservices](../container-app/microservices/README.md)**.

Tento adresář slouží pouze k navigaci. Neobsahuje žádný `azure.yaml`, `infra/` ani `src/`.
Neprovádějte zde `azd up`.

Ze základního adresáře repozitáře:

```bash
cd examples/container-app/microservices
```

Poté postupujte podle přiloženého README pro předpoklady, nasazení, ověření, lokální
vývoj, praktická cvičení, náklady a úklid.

Vzor obsahuje Node.js API Gateway a pouze pro čtení Python Product Service.
Služby objednávek, uživatelů, notifikací, databáze a zasílání zpráv jsou nápady na rozšíření,
nikoliv implementace zahrnuté v tomto repozitáři.

- [Předchozí: Jednoduché Flask API](../../../../examples/container-app/simple-flask-api)
- [Další: Aplikace s databází](../../../../examples/database-app)
- [Vývoj AI](../../docs/chapter-02-ai-development/README.md)
- [Domovská stránka kurzu](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->