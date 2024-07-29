CREATE TABLE #TEST2 (
    [Id] INT, 
    [A] BIT, 
    [B] BIT, 
    [C] BIT, 
    [D] BIT, 
    [E] BIT
);

INSERT INTO #TEST2 ([Id], [A], [C], [E]) VALUES (1, 1, 0, 1);
INSERT INTO #TEST2 ([Id], [A], [B], [C]) VALUES (2, 1, 1, 1);
INSERT INTO #TEST2 ([Id], [C], [D], [E]) VALUES (1, 0, 0, 1);


select * from #TEST2


CREATE PROCEDURE InvertBitValue
    @Id INT,
    @Column CHAR(1)
AS
BEGIN
    SET NOCOUNT ON;

    IF @Column = 'A'
    BEGIN
        UPDATE #TEST2
        SET [A] = ~[A]
        WHERE [Id] = @Id AND [A] IS NOT NULL;
    END
    ELSE IF @Column = 'B'
    BEGIN
        UPDATE #TEST2
        SET [B] = ~[B]
        WHERE [Id] = @Id AND [B] IS NOT NULL;
    END
    ELSE IF @Column = 'C'
    BEGIN
        UPDATE #TEST2
        SET [C] = ~[C]
        WHERE [Id] = @Id AND [C] IS NOT NULL;
    END
    ELSE IF @Column = 'D'
    BEGIN
        UPDATE #TEST2
        SET [D] = ~[D]
        WHERE [Id] = @Id AND [D] IS NOT NULL;
    END
    ELSE IF @Column = 'E'
    BEGIN
        UPDATE #TEST2
        SET [E] = ~[E]
        WHERE [Id] = @Id AND [E] IS NOT NULL;
    END
END;


BEGIN TRAN 

SELECT * FROM #TEST2

EXEC InvertBitValue @Id = 1, @Column = 'A';
EXEC InvertBitValue @Id = 1, @Column = 'B';
EXEC InvertBitValue @Id = 2, @Column = 'B';
EXEC InvertBitValue @Id = 2, @Column = 'C';
EXEC InvertBitValue @Id = 3, @Column = 'C';
EXEC InvertBitValue @Id = 3, @Column = 'A';


SELECT * FROM #TEST2

ROLLBACK TRAN