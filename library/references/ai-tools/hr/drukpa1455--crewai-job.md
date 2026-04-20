---
url: https://github.com/drukpa1455/crewai-job
stars: 12
last_checked: 2026-04-15
last_commit: 2025-02-06
category: hr
status: active
---
# crewai-job

> Intelligent job application automation system using CrewAI and LangChain to customize CVs and cover letters.

## What's Inside
- Three specialized AI agents: Job Description Crawler, CV Writer, Cover Letter Writer
- Automated CV tailoring based on job requirements, qualifications, and company culture
- Cover letter generation connecting experience with job requirements and company values
- PDF and JPEG output with professional formatting
- Organized output with job-specific naming conventions
- Template-based customization for base documents
- Multi-agent system with data consistency and professional standards

## Stack
- Python (64.1%), HTML (35.9%)
- CrewAI framework (v0.11.0)
- LangChain for LLM tools
- OpenAI API

## File Tree (key paths)
```
crewai-job/
├── job_application_agents.py
├── models.py
├── templates/
├── CV.txt
├── Cover_Letter.txt
├── requirements.txt
└── output/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (3 CrewAI agents)
- Hooks: no

## Notable
- Focused use case: job application automation with authenticity and professionalism
- Simple setup: requires only base CV.txt and Cover_Letter.txt files
- Future improvements planned: more job board platforms, DOCX/RTF support, batch processing, API integrations
- Follows PEP 8 style guide with black code formatting
