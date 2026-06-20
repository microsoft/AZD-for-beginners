# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Dự án đầu tiên của bạn](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Đã xác thực với `azd 1.25.6` vào tháng 6 năm 2026.

## Introduction

Trong [Your First Project](first-project.md) bạn đã triển khai một ứng dụng bằng cách bắt đầu từ một mẫu. Nhưng hầu hết thời gian bạn đã *có* một ứng dụng—một API Node.js, một dịch vụ Python Flask, một ứng dụng web .NET—nằm trong một thư mục trên máy của bạn. Bài học này cho thấy cách thêm azd vào mã hiện có đó để bạn có thể triển khai nó với `azd up`, không cần mẫu.

## Learning Goals

Kết thúc bài học này, bạn sẽ:
- Hiểu ba cách để bắt đầu một dự án azd
- Chạy `azd init` bên trong một codebase hiện có
- Hiểu `azure.yaml` và thư mục `infra/` làm gì cho ứng dụng của bạn
- Biết khi nào để azd tạo hạ tầng tự động so với khi tự viết
- Triển khai ứng dụng hiện có của bạn lên Azure bằng `azd up`

## Learning Outcomes

Sau khi hoàn thành bài học này, bạn sẽ có thể:
- Khởi tạo azd trong một dự án bạn đã có
- Đọc và chỉnh sửa một file `azure.yaml` cơ bản
- Tạo hạ tầng khởi đầu với `azd infra generate`
- Chọn host Azure phù hợp cho ứng dụng của bạn
- Triển khai và dọn dẹp ứng dụng của riêng bạn

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

You already practiced the first option. This lesson covers the second—the most common real-world scenario.

---

## Step 1: Run `azd init` in Your Project

Open a terminal **bên trong thư mục dự án hiện có của bạn** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Chọn **"Sử dụng mã trong thư mục hiện tại."** azd then scans your folder, detects your language and framework, and proposes a host.

### What azd detects

azd tìm kiếm các dấu hiệu như `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, hoặc một `Dockerfile`, và đề xuất một host Azure phù hợp:

| Your app | Likely detected host |
|----------|----------------------|
| Ứng dụng web Node.js / Python / .NET | Azure App Service hoặc Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Ứng dụng Function | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Xác nhận dịch vụ(s) được phát hiện, và azd scaffolds the files you need.

---

## Step 2: Understand What azd Created

After init, you'll have two new things in your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

Đây là trái tim của một dự án azd. Một file tối thiểu trông như sau:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Khối `services` là phần then chốt: mỗi mục ánh xạ một thư mục mã của bạn tới một host Azure. Nếu ứng dụng của bạn có cả frontend và API, bạn sẽ có hai dịch vụ.

### `infra/` — your Azure resources as code

Thư mục `infra/` chứa các file Bicep định nghĩa các tài nguyên Azure mà ứng dụng của bạn cần (App Service, cơ sở dữ liệu, v.v.). Bạn không phải viết chúng bằng tay—azd tạo ra một điểm khởi đầu hoạt động. Bạn *có thể* chỉnh sửa chúng sau để thêm tài nguyên hoặc thắt chặt bảo mật (được đề cập trong [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Muốn xem hoặc tùy chỉnh hạ tầng đã tạo trước khi triển khai? Chạy `azd infra generate` (cũng có dưới tên `azd infra synth`) để ghi IaC ra đĩa để bạn có thể xem xét và quản lý phiên bản.

---

## Step 3: Set Required Configuration

Nếu ứng dụng của bạn cần các cài đặt hoặc bí mật (chuỗi kết nối, khóa API), đừng mã hóa cứng chúng. Sử dụng các giá trị môi trường:

```bash
# Tạo một môi trường
azd env new dev

# Đặt một giá trị không bí mật
azd env set API_VERSION 1.0.0
```

Đối với bí mật thực sự, lưu trữ chúng trong Key Vault và tham chiếu từ hạ tầng của bạn—xem [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# Xác thực (bắt buộc cho azd)
azd auth login

# Xem trước các tài nguyên sẽ được tạo
azd provision --preview

# Cung cấp hạ tầng và triển khai mã của bạn
azd up
```

Khi hoàn tất, azd in URL của ứng dụng bạn. Xác minh theo cùng cách như bất kỳ ứng dụng azd nào:

```bash
azd show           # hiển thị các điểm cuối
azd monitor --logs # kiểm tra nhật ký nếu cần
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

For more, see [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Sử dụng mã trong thư mục hiện tại"** adds azd to an app you already have.
- `azure.yaml` maps your code folders to Azure hosts; `infra/` defines the resources as Bicep.
- `azd infra generate` lets you review or customize the generated infrastructure.
- Once initialized, your existing app uses the exact same `azd up` / `azd down` workflow as a template-based app.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Dự án đầu tiên của bạn](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Related Resources

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->