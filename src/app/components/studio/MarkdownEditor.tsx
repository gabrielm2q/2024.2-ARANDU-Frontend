'use client';

import React, { useState, useRef } from 'react';
import ReactMarkdown from 'react-markdown';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';
import 'katex/dist/katex.min.css';
import { AppBar, Toolbar, IconButton, Tooltip, Box, Button } from '@mui/material';
import TitleIcon from '@mui/icons-material/Title';
import FormatListBulletedIcon from '@mui/icons-material/FormatListBulleted';
import FunctionsIcon from '@mui/icons-material/Functions';
import BoldIcon from '@mui/icons-material/FormatBold';
import ItalicIcon from '@mui/icons-material/FormatItalic';

const MarkdownEditor: React.FC = () => {
  const [markdown, setMarkdown] = useState('');
  const textareaRef = useRef<HTMLTextAreaElement>(null);

  const handleChange = (value: string) => {
    setMarkdown(value);
  };

  const insertTextAtSelection = (before: string, after: string, defaultText: string) => {
    if (textareaRef.current) {
      const start = textareaRef.current.selectionStart;
      const end = textareaRef.current.selectionEnd;
      const selectedText = markdown.substring(start, end);

      const textToInsert = selectedText || defaultText; // Se não houver texto selecionado, usa o template padrão
      const newText = markdown.substring(0, start) + before + textToInsert + after + markdown.substring(end);

      setMarkdown(newText);

      // Seleciona o texto inserido
      setTimeout(() => {
        textareaRef.current!.selectionStart = start + before.length;
        textareaRef.current!.selectionEnd = start + before.length + textToInsert.length;
        textareaRef.current!.focus();
      }, 0);
    }
  };

  const handleSave = () => {
    // Lógica para salvar conteúdo
    alert('Conteúdo salvo!');
  };

  return (
    <Box display="flex" flexDirection="column" height="100vh">
      <AppBar position="static" style={{ backgroundColor: '#1F1F1F' }}>
        <Toolbar>
          <Tooltip title="Negrito">
            <IconButton color="inherit" onClick={() => insertTextAtSelection('**', '**', 'texto em negrito')}>
              <BoldIcon />
            </IconButton>
          </Tooltip>
          <Tooltip title="Itálico">
            <IconButton color="inherit" onClick={() => insertTextAtSelection('*', '*', 'texto em itálico')}>
              <ItalicIcon />
            </IconButton>
          </Tooltip>
          <Tooltip title="Título">
            <IconButton color="inherit" onClick={() => insertTextAtSelection('# ', '\n', 'Título')}>
              <TitleIcon />
            </IconButton>
          </Tooltip>
          <Tooltip title="Lista">
            <IconButton color="inherit" onClick={() => insertTextAtSelection('- ', '\n', 'Item da lista')}>
              <FormatListBulletedIcon />
            </IconButton>
          </Tooltip>
          <Tooltip title="LaTeX">
            <IconButton color="inherit" onClick={() => insertTextAtSelection('$$', '$$\n', 'E = mc^2')}>
              <FunctionsIcon />
            </IconButton>
          </Tooltip>
          <Button
            onClick={handleSave}
            style={{
              marginLeft: 'auto',
              backgroundColor: '#6667AB',
              color: '#FFFAFA',
              fontWeight: 'bold',
              borderRadius: '50px',
              padding: '10px 30px',
              fontSize: '16px'
            }}
          >
            Salvar
          </Button>
        </Toolbar>
      </AppBar>
      <Box display="flex" flex={1}>
        <Box className="editor" flex={1} style={{ backgroundColor: '#FFFAFA', borderRight: '1px solid #E0E0E0' }}>
          <textarea
            ref={textareaRef}
            value={markdown}
            onChange={(e) => handleChange(e.target.value)}
            style={{ width: '100%', height: '100%', padding: '10px', fontSize: '16px', boxSizing: 'border-box', border: 'none' }}
          />
        </Box>
        <Box className="preview" flex={1} style={{ padding: '20px', boxSizing: 'border-box', overflowY: 'auto', backgroundColor: '#FFF5EE' }}>
          <ReactMarkdown
            remarkPlugins={[remarkMath]}
            rehypePlugins={[rehypeKatex]}
          >
            {markdown}
          </ReactMarkdown>
        </Box>
      </Box>
    </Box>
  );
};

export default MarkdownEditor;
