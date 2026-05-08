@echo off
chcp 65001 >nul
title Pousser sur GitHub - Let's Flow
color 0B

echo.
echo  ===============================================
echo    ENVOI DES MODIFICATIONS SUR GITHUB
echo    Let's Flow - Site web
echo  ===============================================
echo.

cd /d "%~dp0"

echo  [1/5] Nettoyage du fichier verrou...
if exist .git\index.lock del /F /Q .git\index.lock 2>nul
echo  OK.
echo.

echo  [2/5] Recuperation des dernieres modifs en ligne...
git pull
if errorlevel 1 goto erreur
echo.

echo  [3/5] Ajout de tous les changements...
git add .
if errorlevel 1 goto erreur
echo.

echo  [4/5] Creation du commit...
git commit -m "MAJ du site - nouvelles pages et photos"
echo.

echo  [5/5] Envoi sur GitHub...
git push
if errorlevel 1 goto erreur
echo.

echo  ===============================================
echo    TOUT EST POUSSE SUR GITHUB !
echo    Tu peux fermer cette fenetre.
echo  ===============================================
echo.
pause
exit /b 0

:erreur
echo.
echo  ===============================================
echo    UNE ERREUR EST SURVENUE
echo.
echo    Fais une capture d'ecran de cette fenetre
echo    et envoie-la a Claude.
echo  ===============================================
echo.
pause
exit /b 1
